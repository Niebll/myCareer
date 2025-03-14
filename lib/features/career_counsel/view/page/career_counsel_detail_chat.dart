import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class CareerCounselDetailChat extends StatefulWidget {
  const CareerCounselDetailChat({Key? key}) : super(key: key);

  @override
  State<CareerCounselDetailChat> createState() => _CareerCounselDetailChatState();
}

class _CareerCounselDetailChatState extends State<CareerCounselDetailChat> {

  final List<Map<String, String>> messages = [
    {
      "text": "Hi? anything i can do?",
      "time": "10:01",
      "isUser": "false",
    },
  ];
  final TextEditingController _controller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "Sesi Konsultasi"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 13.h,),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                  border: Border.all(color: ColorValue.primary20Color),
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: Row(
                children: [
                  Container(
                    width: 95.w,
                    height: 118.h,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r)
                    ),
                    child: Image.asset("assets/images/career_counsel/profile_company.jpg", fit: BoxFit.cover,),
                  ),
                  SizedBox(width: 16.w,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Dinda Anggaraini Wijayanto", style: textTheme.bodyLarge,),
                      SizedBox(height: 4.h,),
                      Text("Bisnis", style: textTheme.bodySmall,),
                      SizedBox(height: 4.h,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: ColorValue.bgNavColor
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/icons/app_bar_work_bag.svg", height: 12.h, width: 12.w,),
                            SizedBox(width: 8.w,),
                            Text("10 tahun", style: textTheme.bodyMedium!.copyWith(
                              color: ColorValue.netralColor
                            ),),

                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  bool isUser = message["isUser"] == "true";
                  return Align(
                    alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      padding: EdgeInsets.all(12.w),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      decoration: BoxDecoration(
                        color:
                        isUser
                            ? ColorValue.primary90Color
                            : ColorValue.primary20Color,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // Pastikan waktu ada di bawah teks
                        children: [
                          Flexible(
                            // Supaya teks bisa wrap kalau panjang
                            child: Text(
                              message["text"]!,
                              style: textTheme.bodySmall!.copyWith(
                                color:
                                isUser
                                    ? Colors.white
                                    : ColorValue.netralColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w), // Jarak antara teks dan waktu
                          Text(
                            message["time"]!,
                            style: textTheme.bodySmall!.copyWith(
                              color:
                              isUser ? Colors.white : ColorValue.netralColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Tanyakan apa saja...",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide.none,
                      ),
                      hintStyle: textTheme.bodyMedium!.copyWith!(
                        color: ColorValue.primary20Color,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.send,
                          color: ColorValue.primary90Color,
                        ),
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            setState(() {
                              messages.add({
                                "text": _controller.text,
                                "time":
                                "${DateTime.now().hour}:${DateTime.now().minute}",
                                "isUser": "true",
                              });
                              _controller.clear();
                            });
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(color: Colors.white, height: 32.h, width: double.infinity),

          ],
        ),
      ),
    );
  }
}
