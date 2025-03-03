import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_tips_card_widget.dart';

import '../../../../core/custom_widgets/custom_app_bar_widget.dart';
import '../../../../core/theme/color_value.dart';

class BidangKerjaPage extends StatefulWidget {
  const BidangKerjaPage({Key? key}) : super(key: key);

  @override
  State<BidangKerjaPage> createState() => _BidangKerjaPageState();
}

class _BidangKerjaPageState extends State<BidangKerjaPage> {

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  final _workPositionController = TextEditingController();
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Bidang Kerja'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0.h),
              CustomTipsCardWidget(
                text:
                    "Tips : Beri tahu pekerjaan yang kamu inginkan agar kami bisa rekomendasikan lowongan yang sesuai",
              ),
              SizedBox(height: 16.0.h),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Jenjang Pendidikan",
                          style: textTheme.bodyMedium,
                        ),
                        Text(
                          "*",
                          style: textTheme.bodyMedium!.copyWith(
                            color: ColorValue.redColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    DropdownButtonHideUnderline(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorValue.primary90Color, width: 1),
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/form_intersex.svg', // Ganti dengan ikon yang kamu inginkan
                            ),
                            Expanded(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Pilih Jenis Kelamin',
                                  style: textTheme.bodyMedium!.copyWith(
                                    color: ColorValue.primary20Color,
                                  ),
                                ),
                                items: items
                                    .map(
                                      (item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: textTheme.bodyMedium,
                                    ),
                                  ),
                                )
                                    .toList(),
                                value: selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    selectedValue = value;
                                  });
                                },
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.zero, // Hapus padding agar pas dalam container
                                ),
                                iconStyleData: IconStyleData(
                                  icon: SvgPicture.asset(
                                    'assets/icons/form_arrow_down.svg',
                                  ),
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    color: Colors.white,
                                    border: Border.all(color: ColorValue.primary90Color, width: 1),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    CustomFormWidget(label: "Role Kerja", hint: "Ketik role kerja kamu", svg: "form_people.svg", textEditingController: _workPositionController, isMandatory: true,),
                    SizedBox(height: 395.h),
                    CustomButtonWidget(label: "Selanjutnya", onPressed: () {}),
        
                  ],
                ),
              ),
        
            ],
          ),
        ),
      ),
    );
  }
}
