// https://medium.com/@mehmetf_71205/inheriting-widgets-b7ac56dbbeb1
// 上述链接文章，了解了navigator会造成不能直接得到inheritedWidget，建议是用url传参（当然我没这么做）
// ---
// https://stackoverflow.com/questions/49328362/get-access-to-the-context-of-inheritedwidget/49329255#49329255
// 上述链接的回答讲了怎么在navigator之间共享inheritedWidget
// ---
// https://gist.github.com/Blasanka/bc4ed7bbf546ab3c8585ede639ba1ee2
// 参考上述链接示例，重构示例
// ---
// 不可将fetch写在build方法中：https://flutter.io/docs/cookbook/networking/fetch-data#5-moving-the-fetch-call-out-of-the-build-method

import 'package:flutter/material.dart';
import 'package:flutter_examples/pages.dart';
import 'state.dart';
import 'api.dart' as api;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  String userName = '--';
  bool loading = true;

  void update({userName}) {
    setState(() {
      this.userName='--';
      loading=true;
    });
    api.update().then((result) {
      if(result=='OK'){
        load();
      }
    });
  }

  Future<void> load() async {
    setState(() {
      loading = true;
    });

    var data = await api.load();

    setState(() {
      loading = false;
      userName = data;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShowInfoPage(),
      builder: (context, child) {
        return new MyState(
          update: this.update,
          load: this.load,
          userName: this.userName,
          loading: this.loading,
          child: child,
        );
      },
    );
  }
}
