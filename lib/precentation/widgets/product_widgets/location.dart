import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/domain/models/product_detail_model.dart';
import 'package:hakaton_uic/utils/colors.dart';

class Location extends StatelessWidget {
  const Location({
    super.key,
    required this.address,
  });
  final Address address;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: kWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Местоположение",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                SvgPicture.asset("assets/svg/location.svg"),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "г. ${address.name}",
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            height: 180,
            color: kDarkGreyColor,
          )
        ],
      ),
    );
  }
}
