import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/precentation/auth_pages/login_page.dart';
import 'package:hakaton_uic/precentation/auth_pages/registration_page.dart';
import 'package:hakaton_uic/precentation/widgets/w_custom_button.dart';
import 'package:hakaton_uic/utils/colors.dart';

class UnAuthPage extends StatelessWidget {
  const UnAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          elevation: 0.4,
          title: Text(
            "profile".tr(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/svg/store.svg"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "logoutTitle".tr(),
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "logoutSubtitle".tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kDarkGreyColor),
                ),
                const SizedBox(
                  height: 16,
                ),
                InkWell(
                  customBorder: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  onTap: () =>
                      Navigator.pushNamed(context, LoginPage.routeName),
                  child: Ink(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: kFillColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "logIn".tr(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(),
                    Text("or".tr()),
                    Divider(),
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
        ));
  }
}
