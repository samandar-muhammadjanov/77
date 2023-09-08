import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/utils/colors.dart';
import 'package:hakaton_uic/utils/icons.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmer extends StatelessWidget {
  const CategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        padding: const EdgeInsets.all(16),
        itemCount: 20,
        shrinkWrap: true,
        itemBuilder: (context, i) {
          return Stack(
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
                  title: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 20,
                      width: 80,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  subtitle: Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 10,
                      width: 80,
                      decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                  trailing: SvgPicture.asset(chevron),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
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
                ),
              )
            ],
          );
        });
  }
}
