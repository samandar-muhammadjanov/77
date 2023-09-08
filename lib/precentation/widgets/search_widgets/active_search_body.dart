import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/icons.dart';

class ActiveSearchBody extends StatelessWidget {
  const ActiveSearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "popularSearches".tr(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: kGreyTextColor,
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            minLeadingWidth: 0,
            leading: SvgPicture.asset(
              "assets/svg/star-02.svg",
              width: 25,
            ),
            title: const Text(
              "Ноутбуки и планшеты",
            ),
            trailing: SvgPicture.asset(chevron),
          )
        ],
      ),
    );
  }
}
