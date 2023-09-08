import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/domain/models/categories_model.dart';
import 'package:hakaton_uic/precentation/widgets/category_widgets/category_detail.dart';
import '/utils/colors.dart';
import '/utils/icons.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Categories category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .read<ProductBloc>()
            .add(GetProductsEvent("?category_ids=${category.id}"));
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryDetail(
              categories: category.childs,
              title: category.name,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 0),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: kBlack.withOpacity(0.08))
              ],
            ),
            child: ListTile(
              minLeadingWidth: 10,
              leading: const SizedBox(),
              title: Text(category.name),
              subtitle: Text("${category.adsCount} объявлений"),
              trailing: SvgPicture.asset(chevron),
            ),
          ),
          Container(
            width: 64,
            height: 64,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: kBlack.withOpacity(0.08))
                ],
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kFillColor)),
            child: category.icon.split(".").last != "svg"
                ? Image.network(
                    "https://backendmaster.pythonanywhere.com${category.icon}")
                : SvgPicture.network(
                    "https://backendmaster.pythonanywhere.com${category.icon}"),
          )
        ],
      ),
    );
  }
}
