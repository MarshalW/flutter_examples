// 参见：https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/
// 在1.1 Previous implementation，提到了对ancestorWidgetOfExactType等的使用

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String _appName = 'My Tools';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  String _state = 'init';

  updateState() {
    setState(() {
      print('>>>update state');
      _state = 'updated at ${DateTime.now()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: _MyTextWidget(),
      ),
    );
  }
}

class _MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 可以这样得到祖先widget的属性
    var name = (context.ancestorWidgetOfExactType(MyApp) as MyApp)._appName;
    // 可以这样得到祖先Widget的State对象ancestorWidgetOfExactType
    _AppPageState state =
        context.ancestorStateOfType(const TypeMatcher<_AppPageState>());

    return Column(
      children: <Widget>[
        Text('My text widget, App name: $name, ${state._state}'),
        RaisedButton(
          child: const Text('刷新'),
          onPressed: () {
            state.updateState();
          },
        )
      ],
    );
  }
}
