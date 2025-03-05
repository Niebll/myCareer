import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/color_value.dart';

class CustomTabbarWidget extends StatefulWidget {
  final String title;
  final int length;
  final List<Widget> tabs;

  const CustomTabbarWidget({Key? key, required this.title, required this.length, required this.tabs}) : super(key: key);

  @override
  State<CustomTabbarWidget> createState() => _CustomTabbarWidgetState();
}

class _CustomTabbarWidgetState extends State<CustomTabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.length, // Jumlah tab
      child: AppBar(
        title: Text(widget.title), // Pastikan title adalah Widget
        elevation: 0,
        surfaceTintColor: Colors.white,
        leading: Padding(
          padding: EdgeInsets.only(left: 0.w),
          child: IconButton(
            icon: SvgPicture.asset(
              "assets/icons/arrow_left.svg",
              color: ColorValue.netralColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottom: TabBar(
          indicatorColor: ColorValue.secondary90Color, // Warna indikator aktif
          labelColor: ColorValue.secondary90Color, // Warna teks aktif
          unselectedLabelColor: ColorValue.netralColor, // Warna teks tidak aktif
          tabs: [
            for (int i = 0; i < widget.length; i++)
              widget.tabs[i]
          ],
        ),
      ),
    );
  }
}
