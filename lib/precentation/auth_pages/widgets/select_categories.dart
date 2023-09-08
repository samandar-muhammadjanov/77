import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/utils/colors.dart';

class SelectCategoriesModalPopup extends StatefulWidget {
  const SelectCategoriesModalPopup({
    super.key,
    this.getCategoryId,
  });
  final Function(int, String)? getCategoryId;
  @override
  State<SelectCategoriesModalPopup> createState() =>
      _SelectCategoriesModalPopupState();
}

class _SelectCategoriesModalPopupState
    extends State<SelectCategoriesModalPopup> {
  int currentIndex = 10000;
  int categoryId = 0;
  String categoryName = '';
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 5,
            width: 36,
            decoration: BoxDecoration(
                color: const Color(0xffD5D8DB),
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "selectCategory".tr(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset("assets/svg/close.svg"),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                ),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryInitial) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryLoaded) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          height: 0,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return ListTile(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                                categoryId = category.id;
                                categoryName = category.name;
                              });
                            },
                            title: Text(
                              category.name,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            trailing: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: kLightGrey),
                              ),
                              child: currentIndex == index
                                  ? FractionallySizedBox(
                                      child: AnimatedContainer(
                                        height: currentIndex == index ? 20 : 0,
                                        duration:
                                            const Duration(milliseconds: 300),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                offset: const Offset(0, 2),
                                                color: kPrimaryColor
                                                    .withOpacity(0.2),
                                                spreadRadius: 0,
                                                blurRadius: 10)
                                          ],
                                          border: Border.all(
                                              color: kPrimaryColor, width: 5.5),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ),
                          );
                        },
                      );
                    } else if (state is CategoryError) {
                      return const SizedBox();
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.getCategoryId!(categoryId, categoryName);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shadowColor: kWhite,
                      minimumSize: const Size(double.infinity, 44),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "select".tr(),
                      style:
                          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
