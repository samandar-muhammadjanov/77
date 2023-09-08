import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/precentation/widgets/category_widgets/subcategory_detail.dart';
import 'package:hakaton_uic/precentation/widgets/w_app_bar.dart';
import 'package:hakaton_uic/utils/colors.dart';

class CategorySubDetail extends StatelessWidget {
  const CategorySubDetail({super.key, required this.title, this.subtitle});
  static const routeName = "/category-subdetail";
  final String title;
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      "Аксессуары",
      "Мобильные телефоны",
      "Сим карты / тарифы / номера",
      "Смартфоны",
      "Прочие телефоны",
      "Стационарные телефоны",
      "Ретро телефоны",
      "Телефон лягушки"
    ];
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/svg/chevron-left.svg"),
                        Text(
                          subtitle ?? "",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return ListTile(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SubcategoryDetail(title: category),
                          ),
                        ),
                        title: Text(
                          category,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
