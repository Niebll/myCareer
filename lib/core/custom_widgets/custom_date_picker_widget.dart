import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CustomDatePickerField extends StatefulWidget {
  final TextEditingController controller;
  final VoidCallback onTap;
  final String hintText;
  final String label;
  bool isMandatory;

  CustomDatePickerField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.onTap,
    this.isMandatory = false,
  });

  @override
  State<CustomDatePickerField> createState() => _CustomDatePickerFieldState();
}

class _CustomDatePickerFieldState extends State<CustomDatePickerField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(widget.label, style: Theme.of(context).textTheme.bodyMedium),
            widget.isMandatory
                ? Text(
                    "*",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red,
                        ),
                  )
                : Container(),
          ],
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: ColorValue.primary20Color,
            ),
            hintText: widget.hintText,
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.w),
              child: SvgPicture.asset("assets/icons/form_calendar.svg"),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: ColorValue.primary90Color,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: ColorValue.primary20Color,
              ),
            ),
          ),
          controller: widget.controller,
          readOnly: true,
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
