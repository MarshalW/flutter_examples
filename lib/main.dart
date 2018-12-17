// https://github.com/flutter/flutter/blob/master/examples/layers/widgets/custom_render_box.dart
// 简化，去除touch相关逻辑，只实现自定义的paint

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Dots extends SingleChildRenderObjectWidget {
  const Dots({Key key, Widget child}) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDots();
  }
}

class RenderDots extends RenderConstrainedBox {
  RenderDots() : super(additionalConstraints: BoxConstraints.expand());

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas canvas = context.canvas;

    Paint paint = Paint()..color = const Color(0xff1a237e);
    canvas.drawCircle(Offset(200, 450), 100.0, paint);
    super.paint(context, offset);
  }
}

void main() {
  runApp(Directionality(
      textDirection: TextDirection.ltr,
      child: Dots(
        child: Center(
          child: Text('你好，世界！'),
        ),
      )));
}
