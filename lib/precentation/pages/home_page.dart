import 'package:flutter/material.dart';
import 'package:hakaton_uic/precentation/widgets/product_widgets/popular_categories_with_products.dart';
import 'package:hakaton_uic/utils/size_config.dart';
import '../widgets/product_widgets/popular_products.dart';
import '/precentation/widgets/w_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: appBar(context),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        shrinkWrap: true,
        children: const [
          PopularProducts(),
          SizedBox(height: 30),
          PopularCategoriesWithProducts(),
        ],
      ),
    );
  }
}
