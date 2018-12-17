import 'package:flutter/rendering.dart';

void main() {
  final rootNode = RenderParagraph(
    TextSpan(
      text: "你好，世界！",
      style: TextStyle(fontSize: 150)
    ),
    textDirection: TextDirection.ltr,
  );
  RenderingFlutterBinding(root: rootNode);
}
