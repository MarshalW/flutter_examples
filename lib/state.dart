import 'package:flutter/cupertino.dart';

class MyState extends InheritedWidget {
  MyState({Key key, this.update, this.userName,Widget child})
      : super(key: key, child: child);

  final Function update;
  final String userName;

  @override
  bool updateShouldNotify(MyState oldWidget) {
    return oldWidget != this;
  }

  static of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyState);
  }
}