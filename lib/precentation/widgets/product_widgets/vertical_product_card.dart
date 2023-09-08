import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/products_model.dart';
import 'package:hakaton_uic/domain/models/user_products_model.dart';
import 'package:hakaton_uic/precentation/pages/product_detail_page.dart';
import 'package:hakaton_uic/precentation/widgets/status_widgets/active_status.dart';
import 'package:hakaton_uic/precentation/widgets/status_widgets/pending_status.dart';
import 'package:hakaton_uic/precentation/widgets/status_widgets/unactive_status.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/extansions.dart';

class ProductsCards extends StatelessWidget {
  const ProductsCards({super.key, this.status, this.product, this.myProducts});
  final dynamic status;
  final Products? product;
  final MyProducts? myProducts;
  @override
  Widget build(BuildContext context) {
    final isMyProduct = product == null;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            slug: isMyProduct ? myProducts!.slug : product!.slug,
          ),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    border: Border.all(color: kWhite)),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  child: Image.network(
                    isMyProduct
                        ? "https://backendmaster.pythonanywhere.com${myProducts!.photos[0]}"
                        : product!.images[0]["image"],
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              if (status != null)
                if (status["status"] == "active") ...{
                  ActiveStatus(date: status["expires_at"])
                } else if (status["status"] == "inactive") ...{
                  const UnactiveStatus()
                } else if (status["status"] == "pending") ...{
                  const PendingStatus()
                }
            ],
          ),
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                const Spacer(),
                Text(
                  isMyProduct ? myProducts!.name : product!.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
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
                        text: isMyProduct
                            ? "${myProducts!.price.formatWithSpaces()}  "
                            : "${product!.price.formatWithSpaces()}  ",
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: isMyProduct
                            ? myProducts!.currency == "uzs"
                                ? "UZS"
                                : "USD"
                            : product!.currency == "uzs"
                                ? "UZS"
                                : "USD",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
