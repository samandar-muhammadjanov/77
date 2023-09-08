import 'package:flutter/material.dart';
import 'package:hakaton_uic/domain/models/product_detail_model.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/image_detail.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/main_details.dart';
import 'package:hakaton_uic/utils/colors.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    super.key,
    required this.product,
  });
  final ProductDetail product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: kWhite),
      child: Column(
        children: [
          ImageDetail(photos: product.photos),
          SizedBox(
            height: 16,
          ),
          MainDetails(product: product),
        ],
      ),
    );
  }
}
