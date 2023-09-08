import 'package:flutter/material.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/popular_categories.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/vertical_product_card.dart';
import 'package:hakaton_uic/precentation/widgets/shimmers/product_shimmer.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/size_config.dart';

class PopularCategoriesWithProducts extends StatelessWidget {
  const PopularCategoriesWithProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        PopularCategories(color: Colors.transparent, tileColor: kWhite),
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
                itemBuilder: (context, index) =>
                    ProductsCards(product: state.products[index]),
              );
            } else if (state is ProductError) {
              return Text(state.error);
            } else {
              return const ProductShimmer();
            }
          },
        ),
      ],
    );
  }
}
