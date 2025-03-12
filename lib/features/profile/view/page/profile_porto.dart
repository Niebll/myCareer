import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/features/profile/widgets/profile_porto_card.dart';

class ProfilePorto extends StatefulWidget {
  const ProfilePorto({Key? key}) : super(key: key);

  @override
  State<ProfilePorto> createState() => _ProfilePortoState();
}

class _ProfilePortoState extends State<ProfilePorto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0.h,
                  mainAxisSpacing: 8.h,
                  mainAxisExtent: 144.25.h,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return ProfilePortoCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
