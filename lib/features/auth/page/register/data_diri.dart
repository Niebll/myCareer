import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/auth/page/register/pendidikan_terakhir.dart';
import 'package:mycareer_new/features/auth/widget/custom_progress_bar_register_widget.dart';

class DataDiriPage extends StatefulWidget {
  const DataDiriPage({Key? key}) : super(key: key);

  @override
  State<DataDiriPage> createState() => _DataDiriPageState();
}

class _DataDiriPageState extends State<DataDiriPage> {
  late TextEditingController _formNoHpController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formNoHpController = TextEditingController();
  }

  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  String _formatPhoneNumber(String input) {
    // Menghapus semua karakter kecuali angka
    String digits = input.replaceAll(RegExp(r'\D'), '');

    // Pastikan angka pertama bukan 0
    if (digits.startsWith('0')) {
      digits = digits.substring(1);
    }

    // Membatasi panjang maksimal 12 angka
    if (digits.length > 16) {
      digits = digits.substring(0, 16);
    }

    // Memformat menjadi xxxx-xxxx-xxxx
    List<String> parts = [];
    for (int i = 0; i < digits.length; i += 4) {
      parts.add(
        digits.substring(i, i + 4 > digits.length ? digits.length : i + 4),
      );
    }
    return parts.join('-');
  }

  DateTime? _dateTime;
  final TextEditingController _dateController = TextEditingController();
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

    if (picked != null) {
      setState(() {
        _dateController.text = _dateFormat.format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBarWidget(title: "Data Diri"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 83.h,
                    width: 83.w,
                    decoration: BoxDecoration(
                      color: ColorValue.secondary90Color,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/profile.svg',
                        height: 45.h,
                        width: 45.w,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 55.w,
                  child: GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: Container(
                      height: 26.h,
                      width: 26.h,
                      decoration: BoxDecoration(
                        color: ColorValue.primary90Color,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/camera.svg',
                          height: 15.h,
                          width: 15.w,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 16.h),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  CustomFormWidget(
                    label: "E-Mail",
                    hint: "Masukkan email",
                    svg: "form_mail.svg",
                    textEditingController: TextEditingController(),
                    isMandatory: true,
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Tanggal Lahir",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      TextFormField(
                        decoration: InputDecoration(
                          hintStyle: textTheme.bodyMedium!.copyWith!(
                            color: ColorValue.primary20Color,
                          ),
                          hintText: "Masukkan Tanggal Lahir",
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: SvgPicture.asset(
                              "assets/icons/form_calendar.svg",
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: ColorValue.primary90Color,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: ColorValue.primary90Color,
                            ),
                          ),
                        ),
                        controller: _dateController,
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Jenis Kelamin",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      DropdownButtonFormField<String>(
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: ColorValue.netralColor,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: SvgPicture.asset(
                              "assets/icons/form_intersex.svg",
                              color: ColorValue.primary90Color,
                            ),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: ColorValue.primary90Color,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: ColorValue.primary90Color,
                            ),
                          ),
                        ),
                        hint: Text(
                          'Masukkan Jenis Kelamin',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: ColorValue.primary20Color,
                          ),
                        ),
                        items: [
                          DropdownMenuItem(
                            value: 'Laki-laki',
                            child: Text('Laki-laki'),
                          ),
                          DropdownMenuItem(
                            value: 'Perempuan',
                            child: Text('Perempuan'),
                          ),
                        ],
                        onChanged: (value) {
                          // Handle perubahan nilai dropdown
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Nomor Whatsapp",
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "*",
                            style: TextStyle(
                              fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Pastikan nomor Whatsapp aktif, agar kamu tidak kehilangan kesempatan untuk mendapatkan panggilan kerja.",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _formNoHpController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10.w),
                            child: Container(
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: ColorValue.primary90Color,
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              child: Center(
                                child: Text(
                                  "+62",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          hintText: 'Masukkan nomor whatsapp',
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                            color: ColorValue.primary20Color,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: ColorValue.primary90Color,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(
                              color: ColorValue.primary90Color,
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          String formatted = _formatPhoneNumber(value);
                          if (formatted != _formNoHpController.text) {
                            _formNoHpController.value = TextEditingValue(
                              text: formatted,
                              selection: TextSelection.collapsed(
                                offset: formatted.length,
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
