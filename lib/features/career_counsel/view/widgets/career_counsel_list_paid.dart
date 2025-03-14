import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/features/career_counsel/view/widgets/career_counsel_list_paid_card.dart';

class CareerCounselListPaid extends StatefulWidget {
  const CareerCounselListPaid({Key? key}) : super(key: key);

  @override
  State<CareerCounselListPaid> createState() => _CareerCounselListPaidState();
}

class _CareerCounselListPaidState extends State<CareerCounselListPaid> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Baru Saja", style: textTheme.bodyLarge),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                  return CareerCounselListPaidCard(img: "assets/images/career_counsel/profile_company.jpg", name: "Dinda Anggaraini Wijayanto", jobType: "Bisnis", workExperience: "10", paymentStatus: "Lunas");
                },)
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
