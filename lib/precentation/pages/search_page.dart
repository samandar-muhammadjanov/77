import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/widgets/search_widgets/active_search_body.dart';
import 'package:hakaton_uic/precentation/widgets/search_widgets/search_panel.dart';
import 'package:hakaton_uic/precentation/widgets/search_widgets/search_results.dart';
import 'package:hakaton_uic/utils/size_config.dart';
import '../widgets/search_widgets/search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocBuilder<SearchOnchangedBloc, SearchOnchangedState>(
      builder: (context, onchangeState) {
        return BlocBuilder<SearchActiveBloc, SearchActiveState>(
          builder: (context, searchState) {
            return Scaffold(
              appBar: AppBar(
                title: SvgPicture.asset("assets/svg/logo.svg"),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/svg/ru.svg"),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/svg/bell.svg"),
                  )
                ],
                bottom: PreferredSize(
                  preferredSize: Size(
                      double.infinity,
                      searchState.isActive || onchangeState.isChanged
                          ? 100
                          : 148),
                  child: const SearchPanel(),
                ),
              ),
              body: onchangeState.isChanged
                  ? const SearchResultBody()
                  : searchState.isActive
                      ? const ActiveSearchBody()
                      : const SearchBody(),
            );
          },
        );
      },
    );
  }
}
