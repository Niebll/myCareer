import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/features/profile/widgets/profile_education_experience_card.dart';

class ProfileEducationExperience extends StatelessWidget {
  const ProfileEducationExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 3,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ProfileEducationExperienceCard(dateStart: "2018", dateEnd: "2022", education: "SMA Negeri 1 Malang", position: "Ketua Osis");
              },
            ),
          ],
        ),
      ),
    );
  }
}
