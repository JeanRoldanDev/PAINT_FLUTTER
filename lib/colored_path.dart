import 'package:flutter/material.dart';

class ColoredPath {
  static const colors = [
    Colors.black,
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.amber,
  ];
  ColoredPath(this.colorIndex);
  final int colorIndex;
  List<Paint>? _paints;

  Paint get paint {
    if (_paints == null) {
      _paints = [];
      for (var color in colors) {
        _paints!.add(
          Paint()
            ..strokeCap = StrokeCap.round
            ..isAntiAlias = true
            ..color = color
            ..strokeWidth = 3
            ..style = PaintingStyle.stroke,
        );
      }
    }
    return _paints![colorIndex];
  }

  final path = Path();

  List<Offset> points = [];

  void addPoint(Offset point) {
    if (points.isEmpty) {
      path.moveTo(point.dx, point.dy);
    } else {
      path.lineTo(point.dx, point.dy);
    }
    points.add(point);
  }
}
