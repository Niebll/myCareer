import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_text_bar_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_detail_payment.dart';

class CareerConuselBookingPage extends StatefulWidget {
  const CareerConuselBookingPage({Key? key}) : super(key: key);

  @override
  State<CareerConuselBookingPage> createState() =>
      _CareerConuselBookingPageState();
}

class _CareerConuselBookingPageState extends State<CareerConuselBookingPage> {
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

  TimeOfDay? selectedTime;
  final TextEditingController _timeController = TextEditingController();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue, // Warna utama
            colorScheme: ColorScheme.light(
              primary: ColorValue.primary90Color, // Warna tombol OK
              onPrimary: Colors.white, // Warna teks tombol OK
              onSurface: Colors.black, // Warna teks di dalam picker
              secondary: ColorValue.primary20Color,
            ),
            timePickerTheme: const TimePickerThemeData(
              backgroundColor: Colors.white,
              // Warna background
              hourMinuteColor: ColorValue.primary90Color,
              // Warna background jam & menit
              hourMinuteTextColor: Colors.white,
              // Warna teks jam & menit
              dialHandColor: Colors.blue,
              // Warna jarum jam
              dialBackgroundColor: Colors.white,
              // Warna latar belakang dial
              entryModeIconColor: Colors.transparent, // Warna ikon mode input
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
        _timeController.text = picked.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Pengajuan Konsultasi"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: ColorValue.primary20Color),
              ),
              child: Row(
                children: [
                  Container(
                    height: 52.h,
                    width: 52.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Image.asset(
                      "assets/images/career_counsel/profile_company.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Dinda Anggraini Wijayanto",
                        style: textTheme.bodyLarge,
                      ),
                      SizedBox(height: 8.h),
                      CustomTextBarWidget(
                        text: "Bisnis",
                        textColor: ColorValue.secondary90Color,
                        containerColor: ColorValue.secondary20Color,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Tanggal Konsul",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: textTheme.bodyMedium!.copyWith!(
                      color: ColorValue.primary20Color,
                    ),
                    hintText: "Pilih Tanggal",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset("assets/icons/form_calendar.svg"),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: ColorValue.primary90Color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: ColorValue.primary90Color),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pilih Waktu Konsul",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  decoration: InputDecoration(
                    hintStyle: textTheme.bodyMedium!.copyWith!(
                      color: ColorValue.primary20Color,
                    ),
                    hintText: "Pilih waktu",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: SvgPicture.asset("assets/icons/card_clock.svg"),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: ColorValue.primary90Color),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.r),
                      borderSide: BorderSide(color: ColorValue.primary90Color),
                    ),
                  ),
                  controller: _timeController,
                  readOnly: true,
                  onTap: () {
                    _selectTime(context);
                  },
                ),
              ],
            ),
            Spacer(),
            if (_timeController.text != "" && _dateController.text != "")
              CustomButtonWidget(label: "Konsultasi Sekarang", onPressed: () {Nav.to(context, CareerCounselDetailPaymentPage());})
            else
              CustomButtonWidget(
                color: ColorValue.secondary60Color,
                label: "Konsultasi Sekarang",
                onPressed: () {},
              ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
