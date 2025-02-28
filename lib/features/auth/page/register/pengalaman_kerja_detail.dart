import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_date_picker_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';

import '../../../../core/custom_widgets/custom_button_widget.dart';

class PengalamanKerjaDetailPage extends StatefulWidget {
  const PengalamanKerjaDetailPage({Key? key}) : super(key: key);

  @override
  State<PengalamanKerjaDetailPage> createState() =>
      _PengalamanKerjaDetailPageState();
}

class _PengalamanKerjaDetailPageState extends State<PengalamanKerjaDetailPage> {
  final TextEditingController _workPlaceController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Pengalaman Kerja'),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Tempat Bekerja",
                isMandatory: true,
                hint: "Masukkan tempat bekerja",
                svg: "form_building.svg",
                textEditingController: _workPlaceController,
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Posisi",
                isMandatory: true,
                hint: "Masukkan jabatan",
                svg: "form_position.svg",
                textEditingController: _positionController,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 16.w * 2,
                    child: CustomDatePickerField(
                      label: "Periode Mulai",
                      hintText: "Pilih tanggal",
                      controller: TextEditingController(),
                      onTap: () {},
                      isMandatory: true,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2 - 16.w * 2,
                    child: CustomDatePickerField(
                      label: "Periode Akhir",
                      hintText: "Pilih tanggal",
                      controller: TextEditingController(),
                      onTap: () {},
                      isMandatory: true,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Deskripsi",
                hint: "",
                svg: "",
                textEditingController: _deskripsiController,
                maxLines: 12,
                isSvg: false,
                isDescription: true,
                description: "Ceritakan pengalamanmu selama kamu bekerja",
              ),
              SizedBox(height: 80.h),
              CustomButtonWidget(
                label: "Simpan",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
