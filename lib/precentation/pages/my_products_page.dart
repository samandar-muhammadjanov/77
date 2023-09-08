import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/pages/add_product_page.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/vertical_product_card.dart';
import 'package:hakaton_uic/precentation/widgets/shimmers/product_shimmer.dart';
import 'package:hakaton_uic/precentation/widgets/w_elevated_button.dart';
import 'package:hakaton_uic/utils/extansions.dart';
import 'package:hakaton_uic/utils/size_config.dart';

class MyPostsPage extends StatelessWidget {
  const MyPostsPage({super.key});
  static const routeName = "/myposts";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset("assets/svg/logo.svg"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: context.localizedFlag(context),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 0),
        child: WElevatedButton(
          onPressed: () =>
              Navigator.pushNamed(context, AddProductPage.routeName),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "createProduct".tr(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SvgPicture.asset("assets/svg/plus-03.svg")
            ],
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        physics: const BouncingScrollPhysics(),
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
                "myProducts".tr(),
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          BlocProvider(
            create: (context) =>
                UserProductBloc()..add(GetUserProducts(context)),
            child: BlocBuilder<UserProductBloc, UserProductState>(
              builder: (context, state) {
                if (state is UserProductInitial) {
                  return const ProductShimmer();
                } else if (state is UserProductLoading) {
                  return const ProductShimmer();
                } else if (state is UserProductLoaded) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.userProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 12,
                        crossAxisCount: 2,
                        childAspectRatio: wi(0.66)),
                    itemBuilder: (context, index) {
                      final item = state.userProducts[index];
                      final status = item.extra;
                      return ProductsCards(
                        myProducts: item,
                        status: status,
                      );
                    },
                  );
                } else if (state is UserProductError) {
                  return const ProductShimmer();
                } else {
                  return const ProductShimmer();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
