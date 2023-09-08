import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/category_widgets/category_sub_detail.dart';
import 'package:hakaton_uic/precentation/widgets/w_app_bar.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/icons.dart';

class CategoryDetail extends StatelessWidget {
  CategoryDetail({super.key, required this.categories, this.title});
  static const routeName = "/category-detail";
  final List<dynamic> categories;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      context.read<ProductBloc>().add(GetProductsEvent(""));
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset("assets/svg/arrow-left.svg")),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  title ?? "",
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const SizedBox(
              height: 24.5,
            ),
            Container(
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategorySubDetail(
                            title: title!,
                            subtitle: category["name"],
                          ),
                        )),
                    title: Text(
                      category["name"],
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    trailing: SvgPicture.asset(chevron),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
