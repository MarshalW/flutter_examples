// 本文示例来源：https://loveky.github.io/2018/07/18/how-flutter-inheritedwidget-works/
// 这是我目前见到最简明的示例

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyWelcomeInfo extends InheritedWidget {
  MyWelcomeInfo({Key key, this.welcomeInfo, Widget child})
      : super(key: key, child: child);

  final String welcomeInfo;

  @override
  bool updateShouldNotify(MyWelcomeInfo oldWidget) {
    return oldWidget.welcomeInfo != welcomeInfo;
  }
}

class MyNestedChild extends StatelessWidget {
  @override
  build(BuildContext context) {
    final MyWelcomeInfo widget =
    context.inheritFromWidgetOfExactType(MyWelcomeInfo);
    return Text(widget.welcomeInfo);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter InheritWidget',
      home: MyWelcomeInfo(
          welcomeInfo: 'hello flutter',
          child: Center(
            child: MyNestedChild(),
          )),
    );
  }
}
