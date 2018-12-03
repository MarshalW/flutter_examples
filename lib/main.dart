// https://medium.freecodecamp.org/how-to-build-a-cryptocurrency-price-list-app-using-flutter-sdk-1c75998e1a58
// 主要参考上述链接示例
// ---
// 如何实现下拉刷新，参考：https://github.com/flutter/flutter/blob/master/examples/flutter_gallery/lib/demo/material/overscroll_demo.dart
// ---
// TODO 如何实现加载更多，参考：https://marcinszalek.pl/flutter/infinite-dynamic-listview/，写的很详细

import 'package:flutter/material.dart';
import 'crypto_list.dart';

void main() {
  runApp(new MaterialApp(
    home: Scaffold(
      body: CryptoListPage(),
      backgroundColor: Colors.blue,
    )
  ));
}
