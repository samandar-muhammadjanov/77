import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/layout_wdiget.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/horizontal_product_card.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/vertical_product_card.dart';
import 'package:hakaton_uic/precentation/widgets/shimmers/product_shimmer.dart';
import 'package:hakaton_uic/precentation/widgets/w_app_bar.dart';
import 'package:hakaton_uic/utils/size_config.dart';

class SubcategoryDetail extends StatelessWidget {
  const SubcategoryDetail({super.key, required this.title});
  static const routeName = "/subcategory-detail";
  final String title;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Row(
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: SvgPicture.asset("assets/svg/arrow-left.svg")),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const LayoutWidget(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductInitial) {
                return const ProductShimmer();
              } else if (state is ProductLoading) {
                return const ProductShimmer();
              } else if (state is ProductLoaded) {
                return BlocBuilder<LayoutBloc, LayoutState>(
                  builder: (context, layoutState) {
                    if (layoutState.isVertical) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                        shrinkWrap: true,
                        itemCount: state.products.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final item = state.products[index];
                          return HorizontalProductCard(product: item);
                        },
                      );
                    }
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 12,
                          crossAxisCount: 2,
                          childAspectRatio: wi(0.66)),
                      itemBuilder: (context, index) =>
                          ProductsCards(product: state.products[index]),
                    );
                  },
                );
              } else if (state is ProductError) {
                return Text(state.error);
              } else {
                return const ProductShimmer();
              }
            },
          ),
        ],
      ),
    );
  }
}
