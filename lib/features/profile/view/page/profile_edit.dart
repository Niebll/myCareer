import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mycareer_new/core/bottom_nav/nav_bar.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';

import '../../../../core/theme/color_value.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Ubah Profil"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h,),
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
              SizedBox(height: 8.h,),
              Text("Ubah foto Profil", style: textTheme.bodyMedium!.copyWith(color: ColorValue.primary90Color),),
              SizedBox(height: 8.h,),
              CustomFormWidget(label: "Nama", hint: "Masukkan nama", svg: "", textEditingController: TextEditingController(), isSvg: false,),
              SizedBox(height: 16.h,),
              CustomFormWidget(label: "Deskripsi", hint: "Deskripsi", svg: "", textEditingController: TextEditingController(), isSvg: false,),
              SizedBox(height: 16.h,),
              CustomFormWidget(label: "Role Kerja", hint: "Role Kerja", svg: "", textEditingController: TextEditingController(), isSvg: false,),
              SizedBox(height: 32.h,),
              CustomButtonWidget(label: "Simpan Perubahan", onPressed: () {
                Nav.toRemoveUntil(context, BottomNav(index: 3,));
              },)
            ],
          ),
        ),
      ),
    );
  }
}
