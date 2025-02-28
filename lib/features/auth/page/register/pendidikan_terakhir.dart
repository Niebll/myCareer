import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_date_picker_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/auth/page/register/pengalaman_kerja.dart';

import '../../../../core/theme/color_value.dart';

class PendidikanTerakhirPage extends StatefulWidget {
  const PendidikanTerakhirPage({Key? key}) : super(key: key);

  @override
  State<PendidikanTerakhirPage> createState() => _PendidikanTerakhirPageState();
}

class _PendidikanTerakhirPageState extends State<PendidikanTerakhirPage> {
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _startSemesterController = TextEditingController();
  final TextEditingController _endSemesterController = TextEditingController();
  final TextEditingController _organizationController = TextEditingController();

  bool _isGraduated = false;

  DateTime? _dateTime;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: ColorValue.primary90Color,
            hintColor: ColorValue.primary20Color,
            colorScheme: ColorScheme.light(
              primary: ColorValue.primary90Color,
              onBackground: ColorValue.secondary90Color,
            ),
            // Warna utama kalender
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _dateTime) {
      setState(() {
        _dateTime = picked;
        _startSemesterController.text = _dateFormat.format(_dateTime!);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Pendidikan Terakhir"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.h),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Pilih Lokasi Saat Ini",
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
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Pilih Provinsi',
                            style: textTheme.bodyMedium!.copyWith(
                              color: ColorValue.primary20Color,
                            ),
                          ),
                          items:
                              items
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
                          buttonStyleData: ButtonStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 8.h),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorValue.primary90Color,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8.r),
                              color: Colors.white,
                            ),
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
                              border: Border.all(
                                color: ColorValue.primary90Color,
                                width: 1,
                              ),
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Sekolah/Perguruan Tinggi",
                hint: "Masukkan Sekolah/Perguruan Tinggi",
                svg: "",
                textEditingController: _schoolController,
                isMandatory: true,
                isSvg: false,
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Jurusan/Program Studi",
                hint: "Masukkan Jurusan",
                svg: "",
                textEditingController: _majorController,
                isMandatory: true,
                isSvg: false,
              ),
              SizedBox(height: 16.h),
              CustomDatePickerField(
                label: "Mulai Pendidikan",
                hintText: "Pilih bulan dan tahun",
                controller: _startSemesterController,
                isMandatory: true,
                onTap: () {
                  _selectDate(context);
                },
              ),
              SizedBox(height: 16.h),
              Container(
                height: 56.h,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8.h),
                decoration: BoxDecoration(
                  color: ColorValue.secondary20Color,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: _isGraduated,
                      onChanged: (bool? value) {
                        setState(() {
                          _isGraduated = value!;
                        });
                      },
                      side: BorderSide(
                        color: ColorValue.secondary90Color,
                        width: 2.w,
                      ),
                      activeColor: ColorValue.primary90Color,
                      checkColor: Colors.white,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    Text(
                      "Saya masih bersekolah/berkuliah disini",
                      style: textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              _isGraduated
                  ? SizedBox()
                  : CustomDatePickerField(
                    label: "Selesai Pendidikan",
                    hintText: "Pilih bulan dan tahun",
                    controller: _startSemesterController,
                    isMandatory: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Pengalaman Organisasi/Pengembangan Diri",
                isDescription: true,
                isMandatory: true,
                description:
                    "Jika ada, ceritakan pengalaman organisasi atau pengembangan diri yang pernah kamu lakukan agar rekruter terkesan",
                hint: "",
                svg: "",
                isSvg: false,
                maxLines: 8,
                textEditingController: _organizationController,
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(label: "Selanjutnya", onPressed: () {
                Nav.to(context, PengalamanKerjaPage());
              }),
              SizedBox(height: 32.h),
            ],
          ),
        ),
      ),
    );
  }
}
