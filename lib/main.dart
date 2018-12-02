// https://medium.freecodecamp.org/how-to-build-a-cryptocurrency-price-list-app-using-flutter-sdk-1c75998e1a58
// 主要参考上述链接示例

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
