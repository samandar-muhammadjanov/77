import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';

class WElevatedButton extends StatelessWidget {
  const WElevatedButton(
      {super.key,
      required this.onPressed,
      required this.child,
      this.color = Colors.blue});
  final Function() onPressed;
  final Widget child;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shadowColor: kWhite,
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 44),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: child,
    );
  }
}
