import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/auth/view/page/register/pendidikan_terakhir.dart';

import '../../../../../core/custom_widgets/custom_button_widget.dart';

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

  final List<String> jenisKelaminList = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];


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
                              color: ColorValue.redColor,
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
                  SizedBox(height: 16.h),
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


                    ],
                  ),
                  SizedBox(height: 16.h),
                  CustomFormWidget(
                    label: "E-Mail",
                    hint: "Masukkan email",
                    svg: "form_mail.svg",
                    textEditingController: TextEditingController(),
                    isMandatory: true,
                    isDescription: true,
                    description:
                        "Pastikan email aktif, agar dapat digunakan untuk di laman login",
                  ),

                  SizedBox(height: 16.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Pilih Lokasi Saat Ini", style: textTheme.bodyMedium),
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
                                    style: textTheme.bodyMedium
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
                                border: Border.all(color: ColorValue.primary90Color, width:1),
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
                                  border: Border.all(color: ColorValue.primary90Color, width: 1),
                                ),
                                padding: EdgeInsets.zero
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Pilih Kota/Kabupaten',
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
                                    style: textTheme.bodyMedium
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
                                border: Border.all(color: ColorValue.primary90Color, width:1),
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
                                  border: Border.all(color: ColorValue.primary90Color, width: 1),
                                ),
                                padding: EdgeInsets.zero
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      DropdownButtonHideUnderline(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Text(
                              'Pilih Kecamatan',
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
                                    style: textTheme.bodyMedium
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
                                border: Border.all(color: ColorValue.primary90Color, width:1),
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
                                  border: Border.all(color: ColorValue.primary90Color, width: 1),
                                ),
                                padding: EdgeInsets.zero
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 32.h),
                  CustomButtonWidget(
                    label: "  Selanjutnya  ",
                    onPressed: () {
                      Nav.to(context, PendidikanTerakhirPage());
                    },
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
