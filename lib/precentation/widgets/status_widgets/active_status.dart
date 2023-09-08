import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:intl/intl.dart';

class ActiveStatus extends StatelessWidget {
  const ActiveStatus({super.key, required this.date});
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: kActive,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Активный",
            style: TextStyle(
                color: kWhite, fontSize: 12, fontWeight: FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(top: 6),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(3)),
            child: Text(
              "до ${DateFormat("dd.MM.yyyy").format(DateTime.parse(date))}",
              style: TextStyle(
                  color: kOrange, fontSize: 10, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
