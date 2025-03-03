import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/auth/page/register/register_end.dart';

class UploadCvPage extends StatefulWidget {
  const UploadCvPage({Key? key}) : super(key: key);

  @override
  State<UploadCvPage> createState() => _UploadCvPageState();
}

class _UploadCvPageState extends State<UploadCvPage> {
  bool isFileSelected = false;
  String fileName = "";
  String fileSize = "";
  String filePath = "";
  String dateNow = DateFormat("d/M/yyyy").format(DateTime.now());

  Future<void> pickPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      String fileName = result.files.single.name; // Get file name
      String filePath = result.files.single.path!; // Get file path
      String fileSize = result.files.single.size.toString(); // Get file size
      print("File Name: $fileName");
      print("File Path: $filePath");

      // Get file size in KB
      int sizeInBytes = result.files.single.size;
      double sizeInKB = sizeInBytes / 1024;
      String formattedSize = "${sizeInKB.toStringAsFixed(1)}KB";

      setState(() {
        isFileSelected = true;
        this.fileName = fileName;
        this.fileSize = formattedSize;
        this.filePath = filePath;
      });

      // Update UI by setting fileName in state
    } else {
      print("User canceled the picker");
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Upload CV"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: pickPDF,
              child: DottedBorder(
                dashPattern: [8, 8],
                color: ColorValue.secondary90Color,
                radius: Radius.circular(8.r),

                borderType: BorderType.RRect,
                child: Container(
                  padding: EdgeInsets.all(8.h),
                  width: double.infinity,
                  decoration: BoxDecoration(color: ColorValue.secondary20Color),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/card_upload.svg",
                            height: 24.h,
                            width: 24.h,
                          ),
                          SizedBox(width: 8.w),
                          Text("Upload CV dari HP", style: textTheme.bodyLarge),
                        ],
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        "Pilih CV terbaru format PDF",
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),

            isFileSelected
                ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Berhasil diupload", style: textTheme.bodyLarge),
                    SizedBox(height: 8.h),
                    DottedBorder(
                      dashPattern: [8, 8],
                      color: ColorValue.primary90Color,
                      radius: Radius.circular(8.r),
                      borderType: BorderType.RRect,
                      child: Container(
                        padding: EdgeInsets.all(8.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorValue.primary20Color,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/icons/card_file.svg",
                              height: 24.h,
                              width: 24.h,
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(fileName, style: textTheme.bodyLarge),
                                Row(
                                  children: [
                                    Text(fileSize, style: textTheme.bodySmall),
                                    SizedBox(width: 14.w),
                                    Container(
                                      height: 4.h,
                                      width: 4.h,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: 14.w),
                                    Text(dateNow,style: textTheme.bodySmall ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isFileSelected = false;
                                });
                              },
                              child: SvgPicture.asset(
                                "assets/icons/card_trash.svg",
                                height: 24.h,
                                width: 24.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                : Container(),
            Spacer(),
            isFileSelected
                ? CustomButtonWidget(
                    label: "Selanjutnya",
                    onPressed: () {
                      Nav.to(context, RegisterEndPage());
                    },
                  )
                :
            CustomButtonWidget(
              label: "Selanjutnya",
              color: ColorValue.secondary60Color,
              onPressed: () {},
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}
