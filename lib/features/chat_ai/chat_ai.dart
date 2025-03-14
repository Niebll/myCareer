import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mycareer_new/core/custom_widgets/custom_app_bar_widget.dart';
import 'package:mycareer_new/core/theme/color_value.dart';

class ChatAiPage extends StatefulWidget {
  const ChatAiPage({Key? key}) : super(key: key);

  @override
  State<ChatAiPage> createState() => _ChatAiPageState();
}

class _ChatAiPageState extends State<ChatAiPage> {
  final List<Map<String, String>> messages = [
    {
      "text": "Halo, Dini apa ada yang bisa saya bantu?",
      "time": "10:00",
      "isUser": "false",
    },
    {
      "text": "Bagaimana cara mendapat pekerjaan sesuai passion",
      "time": "10:01",
      "isUser": "true",
    },
  ];
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = TextTheme.of(context);
    return Scaffold(
      appBar: CustomAppBarWidget(title: "CareerBot"),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                              ? ColorValue.secondary90Color
                              : ColorValue.secondary20Color,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
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
          ),
          Container(color: Colors.white, height: 32.h, width: double.infinity),
        ],
      ),
    );
  }
}
