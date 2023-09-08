// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';

class WCustomButton extends StatelessWidget {
  WCustomButton({
    Key? key,
    this.color,
    required this.text,
    required this.onPressed,
    this.hasBorder = false,
    this.isExpanded = false,
  }) : super(key: key);
  Color? color;
  String text;
  VoidCallback onPressed;
  bool hasBorder;
  bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return (isExpanded)
        ? Expanded(
            child: InkWell(
              customBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              onTap: onPressed,
              child: Ink(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                  color: (hasBorder) ? color : kFillColor,
                  border: (hasBorder) ? Border.all(color: kPrimaryColor) : null,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        color: hasBorder ? kPrimaryColor : kBlack),
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            customBorder: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            onTap: onPressed,
            child: Ink(
              width: double.infinity,
              height: 44,
              decoration: BoxDecoration(
                color: (hasBorder) ? color : kFillColor,
                border: (hasBorder) ? Border.all(color: kPrimaryColor) : null,
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: hasBorder ? kPrimaryColor : kBlack),
                ),
              ),
            ),
          );
  }
}
