import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_tab_indicator.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/profile/view/page/profile_edit.dart';
import 'package:mycareer_new/features/profile/view/page/profile_education_experience.dart';
import 'package:mycareer_new/features/profile/view/page/profile_porto.dart';
import 'package:mycareer_new/features/profile/view/page/profile_stalker.dart';
import 'package:mycareer_new/features/profile/view/page/profile_work_experience.dart';
import 'package:mycareer_new/features/skill_quest/view/page/skill_quest.dart';

import '../../../../core/theme/color_value.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

  @override
  void initState() {
    fixedScroll = false;
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  OverlayEntry? _overlayEntry;

  void _showOverlay(BuildContext context) {
    OverlayState overlayState = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Stack(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: _hideOverlay,
                child: Container(color: Colors.transparent),
              ),
              Positioned(
                top: kToolbarHeight,
                right: 16.w,
                child: Material(
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      Container(
                        width: 180.w,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ClipRRect(
                          child: ClipPath(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaY: 16, sigmaX: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  _buildMenuItem(
                                    "Edit Profile",
                                    ProfileEditPage(),
                                  ),
                                  _buildMenuItem(
                                    "Upload Portfolio",
                                    Container(),
                                  ),
                                  _buildMenuItem("CareerPath", Container()),
                                  _buildMenuItem(
                                    "Penonton",
                                    ProfileStalkerPage(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
    );

    overlayState.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  Widget _buildMenuItem(String text, Widget page) {
    TextTheme textTheme = TextTheme.of(context);
    return GestureDetector(
      onTap: () {
        _hideOverlay();
        Nav.to(context, page);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 10.w),
        decoration:
            text != "Penonton"
                ? BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ColorValue.greyColor),
                  ),
                )
                : null,
        child: Center(
          child: Text(
            text,
            style: textTheme.bodyMedium!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) {
          return [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    height: kToolbarHeight,
                    color: ColorValue.primary90Color,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorValue.primary90Color,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32.r),
                        bottomRight: Radius.circular(32.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 16.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(height: 24.h, width: 24.h),
                            Text(
                              "Profile",
                              style: textTheme.titleMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                if (_overlayEntry == null) {
                                  _showOverlay(context);
                                } else {
                                  _hideOverlay();
                                }
                              },
                              child: SvgPicture.asset(
                                "assets/icons/hamburger.svg",
                                height: 24.h,
                                width: 24.w,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Container(
                          height: 103.h,
                          width: 103.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Image.asset(
                            "assets/images/home/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Dini Anjani",
                          style: textTheme.titleMedium!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Product Designer",
                          style: textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 32.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 22.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: ColorValue.primary20Color,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/card_single_person.svg",
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "1.622",
                                  style: textTheme.titleMedium!.copyWith(
                                    color: ColorValue.primary90Color,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Pengikut",
                              style: textTheme.bodySmall!.copyWith(
                                color: ColorValue.primary90Color,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/card_bookmark.svg",
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "10",
                                  style: textTheme.titleMedium!.copyWith(
                                    color: ColorValue.primary90Color,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Koleksi",
                              style: textTheme.bodySmall!.copyWith(
                                color: ColorValue.primary90Color,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/icons/card_like_heart.svg",
                                  height: 16.h,
                                  width: 16.w,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  "22,2rb",
                                  style: textTheme.titleMedium!.copyWith(
                                    color: ColorValue.primary90Color,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Suka",
                              style: textTheme.bodySmall!.copyWith(
                                color: ColorValue.primary90Color,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "Seorang UI/UX Designer yang berfokus pada menciptakan pengalaman pengguna yang intuitif dan desain antarmuka yang estetis. ",
                      style: textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: TabBar(
                indicator: CustomTabIndicator(),
                controller: _tabController,
                labelStyle: textTheme.labelLarge,
                labelColor: ColorValue.secondary90Color,
                indicatorColor: ColorValue.secondary90Color,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.white,
                tabs: [
                  Tab(icon: _buildIcon("assets/icons/app_bar_porto.svg", 0)),
                  Tab(icon: _buildIcon("assets/icons/app_bar_work_bag.svg", 1)),
                  Tab(
                    icon: _buildIcon("assets/icons/app_bar_education.svg", 2),
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),

          children: [
            ProfilePorto(),
            ProfileWorkExperience(),
            ProfileEducationExperience(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(String asset, int index) {
    bool isSelected = _tabController.index == index;
    return SvgPicture.asset(
      asset,
      colorFilter: ColorFilter.mode(
        isSelected ? ColorValue.primary90Color : ColorValue.greyColor,
        BlendMode.srcIn,
      ),
    );
  }
}
