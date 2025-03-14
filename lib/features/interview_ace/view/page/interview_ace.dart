import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InterviewAcePage extends StatefulWidget {
  const InterviewAcePage({Key? key}) : super(key: key);

  @override
  State<InterviewAcePage> createState() => _InterviewAcePageState();
}

class _InterviewAcePageState extends State<InterviewAcePage> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/page_maintenance.svg",
              width: 300.w,
              height: 300.w,
            ),
            SizedBox(height: 30.h,),
            Text("Coming Soon", style: textTheme.titleMedium,)
          ],
        ),
      ),
    );
  }
}
