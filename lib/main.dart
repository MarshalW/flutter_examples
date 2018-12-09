// 参见：https://www.didierboelens.com/2018/12/reactive-programming---streams---bloc---practical-use-cases/
// 在1.1 Previous implementation，提到了对ancestorWidgetOfExactType等的使用

import 'package:flutter/material.dart';

void main() => runApp(AppPage());

class MyApp extends StatelessWidget {
  final String _appName = 'My Tools';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: _MyTextWidget(),
        ),
      ),
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
    return MyApp();
  }
}

class _MyTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('演示导航后获取State'),
        RaisedButton(
          child: const Text('下一页'),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => _ShowStatePage()));
          },
        )
      ],
    );
  }
}

class _ShowStatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _AppPageState state =
        context.ancestorStateOfType(const TypeMatcher<_AppPageState>());
    return Scaffold(
      appBar: AppBar(
        title: Text('Show state'),
      ),
      body: Column(
        children: <Widget>[
          Text('State: ${state._state}'),
          RaisedButton(
            child: const Text('刷新'),
            onPressed: () {
              state.updateState();
            },
          )
        ],
      ),
    );
  }
}
