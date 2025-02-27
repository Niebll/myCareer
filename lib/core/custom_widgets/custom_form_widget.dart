import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/color_value.dart';

class CustomFormWidget extends StatefulWidget {
  final String label;
  final String hint;
  final String svg;
  final TextEditingController textEditingController;

  //make optional password field
  bool isPassword;
  bool isMandatory;

  CustomFormWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.svg,
    required this.textEditingController,
    this.isPassword = false,
    this.isMandatory = false,
  });

  @override
  State<CustomFormWidget> createState() => _CustomFormWidgetState();
}

class _CustomFormWidgetState extends State<CustomFormWidget> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme
        .of(context)
        .textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(widget.label, style: textTheme.bodyMedium),
            widget.isMandatory ?
            Text("*", style: textTheme.bodyMedium!.copyWith!(color: Colors.red))
                : Container()
          ],
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.textEditingController,
          obscureText: widget.isPassword ? hidePassword : false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: 2.h,
            ),
            hintText: widget.hint,
            hintStyle: textTheme.bodyMedium!.copyWith!(
              color: ColorValue.primary20Color,
            ),
            prefixIcon: Padding(
              padding: EdgeInsets.all(10.w),
              child: SvgPicture.asset("assets/icons/${widget.svg}"),
            ),

            suffixIcon:
            widget.isPassword
                ? IconButton(
              onPressed: () {
                setState(() {
                  hidePassword = !hidePassword;
                });
              },
              icon: Icon(
                hidePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: ColorValue.primary90Color,
              ),
            )
                : null,
          ),
        ),
      ],
    );
  }
}
