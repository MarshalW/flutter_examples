import 'package:flutter/material.dart';

class MyState extends InheritedWidget {
  MyState(
      {Key key,
      this.update,
      this.load,
      this.userName,
      this.loading,
      Widget child})
      : super(key: key, child: child);

  final Function update;
  final Function load;
  final String userName;
  final bool loading;

  @override
  bool updateShouldNotify(MyState oldWidget) {
    return oldWidget != this;
  }

  static of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MyState);
  }
}
