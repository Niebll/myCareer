import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mycareer_new/core/bottom_nav/nav_bar.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/core/theme/color_value.dart';
import 'package:mycareer_new/features/home/view/page/home.dart';

import '../register/data_diri.dart';
import '../register/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController?.dispose();
    _passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: Column(
            children: [
              SizedBox(height: 40.h + kToolbarHeight),
              Center(
                child: SvgPicture.asset(
                  "assets/images/auth/login.svg",
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              SizedBox(height: 8.h),
              CustomFormWidget(
                label: "E-Mail",
                hint: "Masukkan e-mail",
                svg: "form_mail.svg",
                textEditingController: _emailController,
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                label: "Password",
                hint: "Masukkan Password",
                svg: "form_lock.svg",
                textEditingController: _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 32.h),
              CustomButtonWidget(
                label: "Login",
                onPressed: () {
                  Nav.toRemoveUntil(context, BottomNav());
                },
              ),
              SizedBox(height: 16.h,),
              GestureDetector(
                onTap: () {
                  Nav.to(context, RegisterPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Memiliki Akun?", style: textTheme.bodyLarge,),
                    SizedBox(width: 8.w,),
                    Text("Register", style: textTheme.bodyLarge!.copyWith(
                      color: ColorValue.secondary90Color,
                    decoration: TextDecoration.underline,
                      decorationColor: ColorValue.secondary90Color
                    ),

                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
