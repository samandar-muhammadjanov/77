import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hakaton_uic/precentation/pages/my_products_page.dart';
import 'package:hakaton_uic/precentation/pages/profile_setting_page.dart';
import 'package:hakaton_uic/precentation/pages/terms_of_use_page.dart';
import 'package:hakaton_uic/precentation/widgets/language_modal_popup.dart';
import 'package:hakaton_uic/precentation/widgets/profile_widgets/profile_page_items.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/extansions.dart';
import 'package:hakaton_uic/utils/icons.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          height: 30,
        ),
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, ProfileSettingPage.routeName),
          child: Items(
            svg: userCircle,
            title: "personalInfo".tr(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, MyPostsPage.routeName),
          child: Items(
            svg: grid,
            title: "myProducts".tr(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Items(
          svg: settings,
          title: "settings".tr(),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          decoration: BoxDecoration(
              border: Border.all(color: kFillColor),
              borderRadius: BorderRadius.circular(8)),
          child: ListTile(
            minLeadingWidth: 0,
            contentPadding: EdgeInsets.zero,
            title: Text(
              "notification".tr(),
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            trailing: CupertinoSwitch(
              value: true,
              onChanged: (value) {},
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              isScrollControlled: true,
              context: context,
              builder: (context) => const LanguageModalPopup(),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            decoration: BoxDecoration(
                border: Border.all(color: kFillColor),
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              minLeadingWidth: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "lang".tr(),
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    Text("langCode".tr()),
                    const SizedBox(
                      width: 8,
                    ),
                    context.localizedFlag(context)
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, TermsOfUsePage.routeName),
          child: Items(
            svg: privacy,
            title: "termsofuse".tr(),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Items(
          svg: info,
          title: "aboutus".tr(),
        ),
      ],
    );
  }
}
