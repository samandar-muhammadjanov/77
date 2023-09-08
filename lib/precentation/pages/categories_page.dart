import 'package:flutter/material.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/shimmers/category_shimmer.dart';
import '../widgets/category_widgets/category_item.dart';
import '/precentation/widgets/w_app_bar.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryInitial) {
            return const CategoryShimmer();
          } else if (state is CategoryLoading) {
            return const CategoryShimmer();
          } else if (state is CategoryLoaded) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 12,
                );
              },
              padding: const EdgeInsets.all(16),
              physics: const BouncingScrollPhysics(),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final category = state.categories[index];
                return CategoryItem(category: category);
              },
            );
          } else if (state is CategoryError) {
            return Center(
              child: Text(state.error),
            );
          } else {
            return const CategoryShimmer();
          }
        },
      ),
    );
  }
}
