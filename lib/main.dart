// InheritedModel比较新，2018-9才出来，目前示例很少
// 可参见：https://gist.github.com/HansMuller/b947e76c34d941397989eaab537d45ca
// 初步认识是对InheritedWidget的细化，InheritedWidget不能对模型的局部改变做处理，只能无条件的rebuild
// InheritedModel提供了基于aspect的细粒度处理机制
// TODO 待实现


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text('Hello world.'),
      ),
    );
  }
}
