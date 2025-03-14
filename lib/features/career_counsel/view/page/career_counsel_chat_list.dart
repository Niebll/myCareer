import 'package:flutter/material.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/career_counsel/view/page/career_counsel_detail_chat.dart';
import 'package:mycareer_new/features/career_counsel/view/widgets/career_counsel_chat_list_widget.dart';

class CareerCounselChatList extends StatefulWidget {
  const CareerCounselChatList({Key? key}) : super(key: key);

  @override
  State<CareerCounselChatList> createState() => _CareerCounselChatListState();
}

class _CareerCounselChatListState extends State<CareerCounselChatList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
      return GestureDetector(
          onTap: () {
            Nav.to(context, CareerCounselDetailChat());
          },
          child: CareerCounselChatListWidget(img: "assets/images/career_counsel/profile_company.jpg", name: "Dinda Anggaraini W.", lastChat: "Hi, anything i can do?", lastTimeChat: "3j", manyUnreadChat: "1"));
    },);
  }
}
