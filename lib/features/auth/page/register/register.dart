import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mycareer_new/core/custom_widgets/custom_button_widget.dart';
import 'package:mycareer_new/core/custom_widgets/custom_form_widget.dart';
import 'package:mycareer_new/core/nav/nav.dart';
import 'package:mycareer_new/features/auth/page/login/login.dart';
import 'package:mycareer_new/features/auth/page/register/data_diri.dart';

import '../../../../core/theme/color_value.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

  }

  @override
  void dispose() {
    _emailController?.dispose();
    _passwordController?.dispose();
    _confirmPasswordController?.dispose();
    super.dispose();
  }

  late TextEditingController _emailController, _passwordController, _confirmPasswordController;

  @override
  Widget build(BuildContext context) {

    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16.h + kToolbarHeight),
              Center(
                child: SvgPicture.asset(
                  "assets/images/auth/register.svg",
                  placeholderBuilder: (context) => CircularProgressIndicator(),
                ),
              ),
              CustomFormWidget(
                label: "Nama",
                hint: "Masukkan nama",
                svg: "form_people.svg",
                textEditingController: _emailController,
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                isPassword: true,
                label: "Password",
                hint: "Masukkan Password",
                svg: "form_lock.svg",
                textEditingController: _passwordController,
              ),
              SizedBox(height: 16.h),
              CustomFormWidget(
                isPassword: true,
                label: "Konfirmasi Password",
                hint: "Masukkan Password",
                svg: "form_lock.svg",
                textEditingController: _confirmPasswordController,
              ),
              SizedBox(height: 32.h,),
              CustomButtonWidget(label: "Register", onPressed: () {
                Nav.to(context, DataDiriPage());
              },),
              SizedBox(height: 16.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sudah punya akun? ", style: textTheme.bodyLarge,),
                  GestureDetector(
                    onTap: () {
                      Nav.to(context, LoginPage());
                    },
                    child: Text("Login", style: textTheme.bodyLarge!.copyWith(color: ColorValue.secondary90Color),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
