import 'package:flutter/material.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/popular_categories.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/horizontal_product_card.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/vertical_product_card.dart';
import 'package:hakaton_uic/precentation/widgets/shimmers/product_shimmer.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/size_config.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const SizedBox(
          height: 16,
        ),
        PopularCategories(
          padding: const EdgeInsets.all(16),
          color: kWhite,
          tileColor: Colors.transparent,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ProductBloc, ProductState>(
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
                        childAspectRatio: wi(0.66),
                      ),
                      itemBuilder: (context, index) {
                        final item = state.products[index];
                        return ProductsCards(
                            key: ValueKey(item.id), product: item);
                      },
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
        ),
      ],
    );
  }
}
