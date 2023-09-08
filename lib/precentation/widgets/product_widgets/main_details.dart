import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/domain/models/product_detail_model.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/extansions.dart';

class MainDetails extends StatelessWidget {
  const MainDetails({
    super.key,
    required this.product,
  });
  final ProductDetail product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              product.subCategory.name,
              style: TextStyle(
                color: kGreyTextColor,
                fontSize: 12,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 4,
              width: 4,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              product.subCategory.category.name,
              style: TextStyle(
                color: kGreyTextColor,
                fontSize: 12,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          product.name,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: kFillColor, borderRadius: BorderRadius.circular(6)),
              child: Text(
                product.publishedAt.formatApiDate(),
                style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                  color: kFillColor, borderRadius: BorderRadius.circular(6)),
              child: Text(
                "г. ${product.address.district.region.name}",
                style: TextStyle(
                  color: kDarkGreyColor,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            style: TextStyle(color: kBlack),
            children: [
              TextSpan(
                text: product.price.formatWithSpaces(),
                style: TextStyle(
                  color: kBlack,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const TextSpan(text: " "),
              TextSpan(
                text: product.currency == "uzs" ? "UZS" : "USD",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ElevatedButton(
          onPressed: () => null,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            shadowColor: kWhite,
            minimumSize: const Size(double.infinity, 44),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Показать телефон",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                width: 8,
              ),
              SvgPicture.asset("assets/svg/phone.svg")
            ],
          ),
        ),
      ],
    );
  }
}
