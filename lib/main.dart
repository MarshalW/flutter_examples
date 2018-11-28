// 使用InheritedWidget的示例，参考了：https://gist.github.com/ericwindmill/f790bd2456e6489b1ab97eba246fd4c6
// TODO 需要继续完善，更深的widget层次，增加导航，界面的切换

import 'package:flutter/material.dart';

void main() => runApp(new AppContainer(child: new MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  User user;

  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  User user;

  @override
  Widget build(BuildContext context) {
    final container = AppContainer.of(context);
    user = container.user;
    debugPrint('user: $user');
    return new Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: Text('Hello world, ${user.name}'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.edit),
          onPressed: () {
            container.updateUser(name:'Hoke');
          },
        ));
  }
}

class AppContainer extends StatefulWidget {
  final Widget child;
  final User user;

  AppContainer({
    @required this.child,
    this.user,
  });

  @override
  _AppContainerState createState() => _AppContainerState();

  static _AppContainerState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateWidget)
            as _InheritedStateWidget)
        .data;
  }
}

class _AppContainerState extends State<AppContainer> {
  User user = new User('Joe');

  @override
  Widget build(BuildContext context) {
    return new _InheritedStateWidget(
      data: this,
      child: widget.child,
    );
  }

  void updateUser({name}) {
    setState(() {
      user.name = name;
    });
  }
}

class User {
  String name;

  User(this.name);
}

class _InheritedStateWidget extends InheritedWidget {
  final _AppContainerState data;

  _InheritedStateWidget({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateWidget old) => true;
}
