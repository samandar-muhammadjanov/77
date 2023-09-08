// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/precentation/pages/home_page.dart';
import 'package:hakaton_uic/utils/colors.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});
  static const routeName = "/success";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(
            "assets/svg/arrowLeft.svg",
            color: kBlack,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SvgPicture.asset("assets/svg/wishlist.svg"),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Ваша заявка принята!",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "Наши сотрудники свяжутся с вами в\nближайшее время",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kGreyTextColor,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, HomePage.routeName, (route) => false),
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: kWhite,
                  minimumSize: const Size(double.infinity, 44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  "Главная",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
