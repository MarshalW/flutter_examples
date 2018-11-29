// https://medium.com/@mehmetf_71205/inheriting-widgets-b7ac56dbbeb1
// 上述链接文章，了解了navigator会造成不能直接得到inheritedWidget，建议是用url传参（当然我没这么做）
// ---
// https://stackoverflow.com/questions/49328362/get-access-to-the-context-of-inheritedwidget/49329255#49329255
// 上述链接的回答讲了怎么在navigator之间共享inheritedWidget
// ---
// https://gist.github.com/Blasanka/bc4ed7bbf546ab3c8585ede639ba1ee2
// 参考上述链接示例，重构示例

import 'package:flutter/material.dart';
import 'package:flutter_examples/pages.dart';
import 'state.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  String userName = 'Newton';

  void update({userName}) {
    setState(() {
      this.userName = userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowInfoPage(),
      builder: (context, child) {
        return new MyState(
          update: this.update,
          userName: this.userName,
          child: child,
        );
      },
    );
  }
}



