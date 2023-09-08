import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/utils/colors.dart';

class ForgotPasswordModalPopup extends StatelessWidget {
  const ForgotPasswordModalPopup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 36,
            decoration: BoxDecoration(
                color: const Color(0xffD5D8DB),
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
                color: kWhite,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset("assets/svg/close.svg"),
                    )
                  ],
                ),
                SvgPicture.asset("assets/svg/info.svg"),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Забыли пароль? Для восстановления пароля обратитесь администратору",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kDarkGreyColor,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: kWhite,
                    minimumSize: const Size(double.infinity, 44),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  label: const Text(
                    "+998 97 450 45 00",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  icon: SvgPicture.asset("assets/svg/phone.svg"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
