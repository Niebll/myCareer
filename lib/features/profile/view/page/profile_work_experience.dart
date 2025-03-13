import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/profile_work_experience_card.dart';

class ProfileWorkExperience extends StatefulWidget {
  const ProfileWorkExperience({super.key});

  @override
  State<ProfileWorkExperience> createState() => _ProfileWorkExperienceState();
}

class _ProfileWorkExperienceState extends State<ProfileWorkExperience> {
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
                  return ProfileWorkExperienceCard(dateStart: '2023', dateEnd: '2024', company: 'PT Jaya Abadi', job: 'UI/UX Designer',);
              },
            ),
          ],
        ),
      ),
    );
  }
}
