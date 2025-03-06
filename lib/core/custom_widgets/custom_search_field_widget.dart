import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color_value.dart';

class CustomSearchFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController textEditingController;


  CustomSearchFieldWidget({
    super.key,
    required this.hint,
    required this.textEditingController,
  });

  @override
  State<CustomSearchFieldWidget> createState() =>
      _CustomSearchFieldWidgetState();
}

class _CustomSearchFieldWidgetState extends State<CustomSearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(),
        hintText: widget.hint,
        fillColor: Colors.white,
        filled: true,
        hintStyle: textTheme.bodyMedium!.copyWith!(
          color: ColorValue.primary20Color,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.all(10.w),
          child: SvgPicture.asset("assets/icons/form_search.svg"),
        ),
      ),
    );
  }
}
