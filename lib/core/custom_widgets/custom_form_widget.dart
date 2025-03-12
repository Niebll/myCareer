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
  String description;
  int minLines;
  int maxLines;
  bool isPassword;
  bool isDescription;
  bool isMandatory;
  bool isSvg;
  bool isSuffix;
  String suffixIcon;

  CustomFormWidget({
    super.key,
    required this.label,
    required this.hint,
    required this.svg,
    required this.textEditingController,
    this.isDescription = false,
    this.isPassword = false,
    this.isMandatory = false,
    this.isSvg = true,
    this.description = "",
    this.minLines = 1,
    this.maxLines = 1,
    this.isSuffix = false,
    this.suffixIcon = ""
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
            Text("*", style: textTheme.bodyMedium!.copyWith!(color: ColorValue.redColor))
                : Container()
          ],
        ),
        widget.isDescription ? Container(
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Text(
                widget.description,
                style: textTheme.bodySmall
              ),
            ],
          ),
        ) : Container(),
        SizedBox(height: 8.h),
        TextFormField(
          controller: widget.textEditingController,
          obscureText: widget.isPassword ? hidePassword : false,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
              vertical: widget.maxLines>1 ? 10.h : 2.h,
            ),
            hintText: widget.hint,
            hintStyle: textTheme.bodyMedium!.copyWith!(
              color: ColorValue.primary20Color,
            ),

            prefixIcon:
            widget.isSvg ?
            Padding(
              padding: EdgeInsets.all(10.w),
              child: SvgPicture.asset("assets/icons/${widget.svg}"),
            )
            : null,

            suffixIcon: buildSuffixIcon()
          ),
        ),
      ],
    );
  }
  Widget? buildSuffixIcon() {
    if (widget.isSuffix) {
      if (widget.isPassword) {
        return IconButton(
          onPressed: () {
            setState(() {
              hidePassword = !hidePassword;
            });
          },
          icon: Icon(
            hidePassword ? Icons.visibility_off : Icons.visibility,
            color: ColorValue.primary90Color,
          ),
        );
      }
      return Padding(
        padding:  EdgeInsets.all(8.0.w),
        child: SvgPicture.asset("assets/icons/${widget.suffixIcon}"),
      ); // Bisa pakai custom icon jika ada
    }
    return null;
  }
}
