// https://github.com/flutter/flutter/blob/master/examples/layers/rendering/hello_world.dart
// 学习怎样在渲染树绘制文字内容

import 'package:flutter/rendering.dart';

void main() {
  RenderingFlutterBinding(
      root: RenderPositionedBox(
          alignment: Alignment.center,
          child: RenderParagraph(TextSpan(text: '你好，世界！'),
              textDirection: TextDirection.ltr)));
}
