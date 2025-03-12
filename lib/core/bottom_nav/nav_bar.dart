import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/features/profile/view/page/profile.dart';
import 'package:mycareer_new/features/profile/view/page/profile_test.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../features/home/page/home.dart';
import '../theme/color_value.dart';

class BottomNav extends StatefulWidget {
  int index;

  BottomNav({super.key, this.index = 0});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

enum _SelectedTab { home, careerHub, interviewAce, profile }

class _BottomNavState extends State<BottomNav> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  late int selectedItem;

  @override
  void initState() {
    // TODO: implement initState
    selectedItem = widget.index;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          /// GridView
          IndexedStack(
            index: selectedItem,
            children: [HomePage(), HomePage(), HomePage(), ProfileTest()],
          ),

          /// Custom Bottom Navigation Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 58.h,
            child: Container(
              decoration: BoxDecoration(color: ColorValue.bgNavColor),
              child: ClipRRect(
                child: ClipPath(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 16, sigmaX: 16),
                    child: Container(),
                  ),
                ),
              ),
            ),
          ),

          /// Bottom Navigation bar items
          Positioned(
            bottom: -10.h,
            left: 0,
            right: 0,
            height: 58.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildBNBItem("nav_home", "Utama", 0),
                _buildBNBItem("nav_career", "CareerHub", 1),
                _buildBNBItem("nav_interview", "InterviewAce", 2),
                _buildBNBItem("nav_profile", "Profil", 3),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBNBItem(String icon, String title, index) {
    TextTheme textTheme = TextTheme.of(context);
    return ZoomTapAnimation(
      onTap: () {
        setState(() {
          selectedItem = index;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/icons/$icon.svg",
            color:
                selectedItem == index
                    ? ColorValue.primary90Color
                    : ColorValue.greyColor,
            height: 24.h,
            width: 24.w,
          ),
          Text(
            title,
            style: textTheme.bodySmall!.copyWith(
              color:
                  selectedItem == index
                      ? ColorValue.primary90Color
                      : ColorValue.greyColor,
            ),
          ),
        ],
      ),
    );
  }
}
