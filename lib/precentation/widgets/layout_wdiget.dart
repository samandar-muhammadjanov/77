import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/utils/colors.dart';

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchOnchangedBloc, SearchOnchangedState>(
      builder: (context, onchangeState) {
        return BlocBuilder<SearchActiveBloc, SearchActiveState>(
          builder: (context, searchState) {
            if (searchState.isActive || onchangeState.isChanged) {
              return const SizedBox();
            }
            return Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("allPosts".tr()),
                          SvgPicture.asset("assets/svg/chevron-down.svg")
                        ],
                      ),
                    ),
                    BlocBuilder<LayoutBloc, LayoutState>(
                      builder: (context, state) {
                        return Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  context
                                      .read<LayoutBloc>()
                                      .add(VerticalOnEvent());
                                },
                                child: SvgPicture.asset(
                                  "assets/svg/column-horizontal-01.svg",
                                  color: state.isVertical
                                      ? kPrimaryColor
                                      : kGreyTextColor,
                                ),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<LayoutBloc>()
                                      .add(VerticalOffEvent());
                                },
                                child: SvgPicture.asset("assets/svg/grid.svg",
                                    color: !state.isVertical
                                        ? kPrimaryColor
                                        : kGreyTextColor),
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              SvgPicture.asset(
                                  "assets/svg/Frame 2087326051.svg")
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }
}
