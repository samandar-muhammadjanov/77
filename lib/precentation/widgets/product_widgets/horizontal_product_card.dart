import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/products_model.dart';
import 'package:hakaton_uic/precentation/pages/product_detail_page.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/extansions.dart';

class HorizontalProductCard extends StatelessWidget {
  const HorizontalProductCard({super.key, required this.product});
  final Products product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            slug: product.slug,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: kWhite, borderRadius: BorderRadius.circular(12)),
        height: 127,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  border: Border.all(color: kWhite)),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                child: Image.network(
                  product.images[0]["image"],
                  height: 125.94,
                  fit: BoxFit.cover,
                  width: 120,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: kFillColor,
                            borderRadius: BorderRadius.circular(6)),
                        child: Text(
                          "г. Ташкент",
                          style: TextStyle(
                            color: kDarkGreyColor,
                            fontSize: 10,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Text(
                          product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "Вчера, 19:20",
                    style: TextStyle(fontSize: 10, color: kDarkGreyColor),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: kBlack),
                      children: [
                        TextSpan(
                          text: "${product.price.formatWithSpaces()}  ",
                          style: TextStyle(
                            color: kBlack,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text: product.currency == "uzs" ? "UZS" : "USD",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
