import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CustomButtonWidget extends StatefulWidget {
  final String label;
  final Function() onPressed;
  Color color;
  bool isUnderLine;

  CustomButtonWidget({
    super.key,
    required this.label,
    required this.onPressed,
    this.color = ColorValue.secondary90Color,
    this.isUnderLine = false
  });

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: double.infinity,
        height: 44.h,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(child: Text(widget.label, style: textTheme.labelLarge!.copyWith(
          decoration: widget.isUnderLine ? TextDecoration.underline : null,
          decorationColor: Colors.white
        ),)
        ),
      ),
    );
  }
}
