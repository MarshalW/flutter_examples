// https://medium.com/@mehmetf_71205/inheriting-widgets-b7ac56dbbeb1
// 上述链接文章，了解了navigator会造成不能直接得到inheritedWidget，建议是用url传参（当然我没这么做）
// ---
// https://stackoverflow.com/questions/49328362/get-access-to-the-context-of-inheritedwidget/49329255#49329255
// 上述链接的回答讲了怎么在navigator之间共享inheritedWidget

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() {
    return MyAppState();
  }

  static MyAppState of(BuildContext context){
    return (context.inheritFromWidgetOfExactType(MyState) as MyState).data;
  }
}

class MyAppState extends State<MyApp> {

  String userName='Newton';

  void update({userName}){
    setState(() {
      this.userName=userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowInfoPage(),
      builder: (context, child) {
        return new MyState(
          data: this,
          child: child,
        );
      },
    );
  }
}

class MyState extends InheritedWidget {
  MyState({Key key,this.data, Widget child})
      : super(key: key, child: child);

//  final String userName;

  final MyAppState data;

  @override
  bool updateShouldNotify(MyState oldWidget) {
    return oldWidget != this;
  }
}

class ShowInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data=MyApp.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('信息展示'),
      ),
      body: Center(
        child: Text('Hello world, ${data.userName}'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text('编辑'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditInfoPage()));
          }),
    );
  }
}

class EditInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data=MyApp.of(context);
    return Scaffold(
      body: Center(
        child: Text('User name: ${data.userName}'),
      ),
      appBar: AppBar(
        title: Text('信息编辑'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('改变'),
        onPressed: (){
          var userName='Smith';
          if(data.userName=='Smith'){
            userName='Newton';
          }
          data.update(userName: userName);
        },
      ),
    );
  }
}
