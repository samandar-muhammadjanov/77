
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/utils/colors.dart';

class Items extends StatelessWidget {
  const Items({
    super.key,
    required this.svg,
    required this.title,
  });
  final String svg;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: kFillColor),
          borderRadius: BorderRadius.circular(8)),
      child: ListTile(
        minLeadingWidth: 0,
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(svg),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}