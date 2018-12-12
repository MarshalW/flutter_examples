// 最简单的使用RenderObjectWidget
// https://docs.flutter.io/flutter/widgets/Opacity-class.html
// 需要注意的是透明图片，不要直接用Opacity

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
              Opacity(
                opacity: 0.6,
                child: Text('Hello world'),
              ),
              Image.network(
                  'https://storage.googleapis.com/kodehero/blog/2018/09/880b715d-flutter-logo.png',
                  color: Color.fromRGBO(255, 255, 255, 0.5),
                  colorBlendMode: BlendMode.modulate)
            ],
          ),
        ));
  }
}
