import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/layout_wdiget.dart';
import 'package:hakaton_uic/utils/colors.dart';

class SearchPanel extends StatelessWidget {
  const SearchPanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(color: kWhite),
      child: Column(
        children: [
          TextField(
            onTap: () {
              context.read<SearchActiveBloc>().add(ActiveSearchEvent());
            },
            onChanged: (value) {
              context.read<SearchActiveBloc>().add(DisactiveSearchEvent());
              context.read<SearchOnchangedBloc>().add(OnchangeEvent());
              if (value.isEmpty) {
                context.read<SearchActiveBloc>().add(ActiveSearchEvent());
                context.read<SearchOnchangedBloc>().add(OnUnchangeEvent());
              }
            },
            onSubmitted: (value) {
              context.read<SearchOnchangedBloc>().add(OnUnchangeEvent());
              context.read<SearchActiveBloc>().add(DisactiveSearchEvent());
            },
            decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/search.svg"),
                ),
                hintText: "searchHint".tr(),
                hintStyle: TextStyle(
                    color: kHintColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(
                    right: 6,
                  ),
                  width: 107,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kSearchColor,
                      borderRadius: BorderRadius.circular(6)),
                  child: Text(
                    "search".tr(),
                    style: TextStyle(
                        color: kWhite,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kElevatedButtonColor),
                    borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: kElevatedButtonColor),
                    borderRadius: BorderRadius.circular(8))),
          ),
          const LayoutWidget(),
        ],
      ),
    );
  }
}
