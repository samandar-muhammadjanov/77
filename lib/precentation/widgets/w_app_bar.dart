import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/precentation/widgets/language_modal_popup.dart';
import 'package:hakaton_uic/utils/extansions.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    title: SvgPicture.asset("assets/svg/logo.svg"),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) => const LanguageModalPopup(),
        );
      },
      icon: context.localizedFlag(context),
    ),
    actions: [
      IconButton(
        onPressed: () async {},
        icon: SvgPicture.asset("assets/svg/bell.svg"),
      )
    ],
  );
}
