import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';

import '../widgets/profile_stalker_card.dart';

class ProfileStalkerPage extends StatefulWidget {
  const ProfileStalkerPage({Key? key}) : super(key: key);

  @override
  State<ProfileStalkerPage> createState() => _ProfileStalkerPageState();
}

class _ProfileStalkerPageState extends State<ProfileStalkerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Penonton"),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        itemBuilder: (context, index) {
          return ProfileStalkerCard(
            img: "assets/images/profile/watcher.png",
            userName: "Dinda Wijayanto",
            userCompany: "Pt Jaya Abadi",
            userPosition: "Product Manager",
            userTimeVisit: "21 Jam",
          );
        },
      ),
    );
  }
}
