// ignore_for_file: deprecated_member_use

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/domain/models/categories_model.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/icons.dart';
import 'package:shimmer/shimmer.dart';
import "../../blocs/bloc_exports.dart";

class PopularCategories extends StatelessWidget {
  const PopularCategories({
    super.key,
    required this.color,
    required this.tileColor,
    this.padding,
  });
  final Color color;
  final Color tileColor;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      decoration: BoxDecoration(color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "popolarCategories".tr(),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryInitial) {
                return const PopularCategoriesShimmer();
              } else if (state is CategoryLoading) {
                return const PopularCategoriesShimmer();
              } else if (state is CategoryLoaded) {
                return PopularCategoriesItem(
                    tileColor: tileColor, categories: state.categories);
              } else if (state is CategoryError) {
                print(state.error);
                return const SizedBox();
              } else {
                return const PopularCategoriesShimmer();
              }
            },
          )
        ],
      ),
    );
  }
}

class PopularCategoriesShimmer extends StatelessWidget {
  const PopularCategoriesShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: kWhite,
                  border: Border.all(
                    color: kFillColor,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                title: const Text(
                  "Для женщин",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                leading: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: kPrimaryColor,
                      border:
                          Border.all(color: kPrimaryColor.withOpacity(0.016))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(
                      ctg1,
                      width: 20,
                      height: 20,
                      color: kWhite,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PopularCategoriesItem extends StatelessWidget {
  const PopularCategoriesItem({
    super.key,
    required this.tileColor,
    required this.categories,
  });

  final Color tileColor;
  final List<Categories> categories;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            width: MediaQuery.of(context).size.width * 0.6,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: tileColor,
                border: Border.all(
                  color: kFillColor,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: Text(
                category.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              leading: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: kPrimaryColor,
                  border: Border.all(
                    color: kPrimaryColor.withOpacity(0.016),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: category.icon.split(".").last != "svg"
                      ? Image.network(
                          "https://backendmaster.pythonanywhere.com${category.icon}",
                          color: kWhite,
                        )
                      : SvgPicture.network(
                          "https://backendmaster.pythonanywhere.com${category.icon}",
                          color: kWhite,
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
