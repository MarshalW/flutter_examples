// https://stackoverflow.com/questions/51642099/flutter-how-to-create-widget-that-display-renderbox-component
// 参考上述链接，想了解自定义Widget的生成机制，但这个示例跑不起来，只能初步说明render widget和render object的关系

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
        child: Column(
          children: <Widget>[
            Text('Hello'),
            MyWidget()
          ],
        )
      ),
    );
  }
}

class MyWidget extends SingleChildRenderObjectWidget {
  @override
  RenderObject createRenderObject(BuildContext context) {
    return new MyRenderBox(title: 'bar');
  }

  @override
  void updateRenderObject(BuildContext context, MyRenderBox renderObject) {
    renderObject.title='lalala~';
  }
}

class MyRenderBox extends RenderBox {
  String title;

  MyRenderBox({this.title});
}
