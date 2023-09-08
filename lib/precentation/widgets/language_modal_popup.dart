import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/precentation/widgets/radio.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:restart_app/restart_app.dart';

class LanguageModalPopup extends StatelessWidget {
  const LanguageModalPopup({
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
            width: double.infinity,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "selectLanguage".tr(),
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset("assets/svg/close.svg"),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                const LangaugeItems()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LangaugeItems extends StatefulWidget {
  const LangaugeItems({
    super.key,
  });

  @override
  State<LangaugeItems> createState() => _LangaugeItemsState();
}

class _LangaugeItemsState extends State<LangaugeItems> {
  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.locale == const Locale("en", "US") ? true : false;
    bool isRussian = context.locale == const Locale("ru", "RU") ? true : false;
    bool isUzbek = context.locale == const Locale("uz", "UZ") ? true : false;
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              isEnglish = true;
              isUzbek = false;
              isRussian = false;
            });
            context.setLocale(const Locale("en", "US"));
            Navigator.pop(context);
            Restart.restartApp();
          },
          title: const Text(
            "English",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kLightGrey),
              ),
              child: !isEnglish ? const SizedBox() : const CustomRadio()),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          onTap: () {
            setState(() {
              isEnglish = false;
              isUzbek = true;
              isRussian = false;
            });
            context.setLocale(const Locale("uz", "UZ"));
            Navigator.pop(context);
            Restart.restartApp();
          },
          title: const Text(
            "O’zbekcha",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kLightGrey),
              ),
              child: !isUzbek ? const SizedBox() : const CustomRadio()),
        ),
        const Divider(
          height: 0,
        ),
        ListTile(
          onTap: () {
            setState(() {
              isEnglish = false;
              isUzbek = false;
              isRussian = true;
            });
            context.setLocale(const Locale("ru", "RU"));
            Navigator.pop(context);
            Restart.restartApp();
          },
          title: const Text(
            "Русский",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: kLightGrey),
              ),
              child: !isRussian ? const SizedBox() : const CustomRadio()),
        ),
        // Padding(
        //   padding: const EdgeInsets.all(20.0),
        //   child: WElevatedButton(
        //     onPressed: () {
        //       if (isEnglish) {
        //         context.setLocale(const Locale("en", "US"));
        //       } else if (isRussian) {
        //         context.setLocale(const Locale("ru", "RU"));
        //       } else if (isUzbek) {
        //         context.setLocale(const Locale("uz", "UZ"));
        //       }
        //       Restart.restartApp();
        //     },
        //     child: Text(
        //       "Выбирать",
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w600,
        //         color: kWhite,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );
  }
}
