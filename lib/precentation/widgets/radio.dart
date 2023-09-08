import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      child: AnimatedContainer(
        height: 20,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 2),
                color: kPrimaryColor.withOpacity(0.2),
                spreadRadius: 0,
                blurRadius: 10)
          ],
          border: Border.all(color: kPrimaryColor, width: 5.5),
        ),
      ),
    );
  }
}
