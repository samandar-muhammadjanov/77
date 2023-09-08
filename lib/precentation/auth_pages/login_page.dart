import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:hakaton_uic/precentation/auth_pages/registration_page.dart';
import 'package:hakaton_uic/precentation/auth_pages/widgets/forgot_password_modal.dart';
import 'package:hakaton_uic/precentation/widgets/w_custom_button.dart';
import 'package:hakaton_uic/precentation/widgets/w_text_field.dart';
import 'package:hakaton_uic/utils/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        elevation: 0.5,
        title: const Text(
          "Войти",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset("assets/svg/arrowLeft.svg"),
        ),
      ),
      body: const LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final TextEditingController loginController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "welcome".tr(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "welcomeSub".tr(),
              style: TextStyle(
                  color: kGreyTextColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 24,
            ),
            WTextField(
              title: "login".tr(),
              hint: "enterLogin".tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },
              controller: loginController,
            ),
            const SizedBox(
              height: 16,
            ),
            WTextField(
              title: "password".tr(),
              hint: "enterPassword".tr(),
              validator: (value) {
                if (value!.isEmpty) {
                  return '';
                }
                return null;
              },
              controller: passwordController,
              suffix: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/eye_visivle.svg")),
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) => const ForgotPasswordModalPopup(),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  "forgotPassword".tr(),
                  style: TextStyle(color: kPrimaryColor),
                ),
              ),
            ),
            const Spacer(),
            isLoading
                ? SpinKitFadingCircle(
                    color: kDarkGreyColor,
                  )
                : WCustomButton(
                    text: "logIn".tr(),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(
                          const Duration(seconds: 2),
                          () {
                            Repository().login(
                              loginController.text.split('+').join(),
                              passwordController.text,
                              context,
                            );
                            setState(() {
                              isLoading = false;
                            });
                          },
                        );
                      }
                    }),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Divider(),
                Text(
                  "wannabeSeller".tr(),
                  style: TextStyle(color: kGreyTextColor, fontSize: 12),
                ),
                const Divider(),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            WCustomButton(
              text: "signIn".tr(),
              onPressed: () =>
                  Navigator.pushNamed(context, RegistrationPage.routeName),
              hasBorder: true,
            )
          ],
        ),
      ),
    );
  }
}
