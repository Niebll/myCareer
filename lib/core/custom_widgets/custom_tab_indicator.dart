import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CustomTabIndicator extends Decoration {
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomPainter();
  }
}

class _CustomPainter extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = ColorValue.primary90Color
      ..style = PaintingStyle.fill;

    final Rect rect = Rect.fromLTWH(
      offset.dx,
      configuration.size!.height - 4.h, // Letakkan di bawah
      configuration.size!.width,
      4.w, // Tinggi indikator
    );

    final RRect rRect = RRect.fromRectAndCorners(
      rect,
      topLeft: Radius.circular(16.r),
      topRight: Radius.circular(16.r),
    );

    canvas.drawRRect(rRect, paint);
  }
}

