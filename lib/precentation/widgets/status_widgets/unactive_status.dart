import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';

class UnactiveStatus extends StatelessWidget {
  const UnactiveStatus({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: kDisactive,
      ),
      child: Text(
        "Отклонён",
        style:
            TextStyle(color: kWhite, fontSize: 12, fontWeight: FontWeight.w600),
      ),
    );
  }
}
