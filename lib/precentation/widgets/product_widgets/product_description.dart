import 'package:flutter/material.dart';
import 'package:hakaton_uic/utils/colors.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    super.key,
    required this.description,
  });
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Описание",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            description,
            textAlign: TextAlign.left,
          )
        ],
      ),
    );
  }
}
