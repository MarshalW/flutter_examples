//https://github.com/flutter/flutter/blob/master/examples/layers/raw/hello_world.dart
//基本照搬flutter的示例，学习怎么使用最底层的api编写界面

import 'dart:ui';

void beginFrame(Duration timeStamp) {
  double devicePixelRatio = window.devicePixelRatio;
  Size logicalSize = window.physicalSize / devicePixelRatio;

  ParagraphBuilder paragraphBuilder =
      ParagraphBuilder(ParagraphStyle(textDirection: TextDirection.ltr))
        ..addText('你好, 世界！');

  Paragraph paragraph = paragraphBuilder.build()
    ..layout(ParagraphConstraints(width: logicalSize.width));

  Rect physicalBounds = Offset.zero & (logicalSize * devicePixelRatio);
  PictureRecorder recorder = PictureRecorder();
  Canvas canvas = Canvas(recorder, physicalBounds);
  canvas.scale(devicePixelRatio, devicePixelRatio);
  canvas.drawParagraph(
      paragraph,
      Offset((logicalSize.width - paragraph.maxIntrinsicWidth) / 2.0,
          (logicalSize.height - paragraph.height) / 2.0));
  Picture picture=recorder.endRecording();

  SceneBuilder sceneBuilder=SceneBuilder()
  ..pushClipRect(physicalBounds)
  ..addPicture(Offset.zero, picture)
  ..pop();

  window.render(sceneBuilder.build());
}

void main() {
  window.onBeginFrame = beginFrame;
  window.scheduleFrame();
}
