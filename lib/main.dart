// 演示，使用globalKey，获取任意Widget的尺寸和位置

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

  GlobalKey _keyAmber = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: <Widget>[
          GestureDetector(
            child: Container(
              key: _keyAmber,
              color: Colors.amber,
              constraints: BoxConstraints(
                  minHeight: 100
              ),
            ),
            onTap: (){
              final RenderBox box = _keyAmber.currentContext.findRenderObject();
              print('Height is ${box.size.height}, position is ${box.localToGlobal(Offset.zero)}');
            },
          ),
          Container(
            color: Colors.green,
            constraints: BoxConstraints(
              minHeight: 200
            ),
          ),
          Container(
            color: Colors.cyan,
            constraints: BoxConstraints(
                minHeight: 120
            ),
          )
        ],
      )
    );
  }
}
