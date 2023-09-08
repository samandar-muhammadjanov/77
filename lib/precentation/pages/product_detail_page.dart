import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/domain/repositories/repositories.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/about_user.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/location.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/product_description.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/product_images.dart';
import 'package:hakaton_uic/precentation/widgets/shimmers/product_detail_shimme.dart';
import 'package:hakaton_uic/precentation/widgets/w_app_bar.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key, this.slug});
  static const routeName = "/poduct-detail";
  final String? slug;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Repository().getProductDetail(widget.slug!, context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: SvgPicture.asset("assets/svg/arrow-left.svg"),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => ProductDetailBloc()
              ..add(
                GetProductDetail(widget.slug!, context),
              ),
            child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
              builder: (context, state) {
                if (state is ProductDetailInitial) {
                  return const ProductDetailShimmer();
                } else if (state is ProductDetailLoading) {
                  return const ProductDetailShimmer();
                } else if (state is ProductDetailLoaded) {
                  final product = state.productDetail;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProductImages(product: product),
                      SizedBox(height: 16),
                      ProductDescription(description: product.description),
                      SizedBox(height: 16),
                      AboutSeller(seller: product.seller),
                      SizedBox(height: 16),
                      Location(address : product.address),
                    ],
                  );
                } else if (state is ProductDetailError) {
                  return const ProductDetailShimmer();
                } else {
                  return const ProductDetailShimmer();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
