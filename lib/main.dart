// 最简单的使用RenderObjectWidget
// https://docs.flutter.io/flutter/widgets/Opacity-class.html
// 需要注意的是透明图片，不要直接用Opacity
// ---
// https://docs.flutter.io/flutter/widgets/Transform-class.html
// 对变换的最简单的使用

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Image image;

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
                  colorBlendMode: BlendMode.modulate),
              Transform(
                alignment: Alignment.topRight,
                transform: Matrix4.skewY(0.3)..rotateZ(-math.pi / 12.0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  color: const Color(0xFFE8581C),
                  child: const Text('Apartment for rent!'),
                ),
              ),
              Text('Hello ~~~'),
            ],
          ),
        ));
  }
}
