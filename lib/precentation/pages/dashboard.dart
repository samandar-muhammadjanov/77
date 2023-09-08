import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/precentation/pages/categories_page.dart';
import 'package:hakaton_uic/precentation/pages/home_page.dart';
import 'package:hakaton_uic/precentation/pages/profile_page.dart';
import 'package:hakaton_uic/precentation/pages/search_page.dart';
import 'package:hakaton_uic/precentation/pages/unauth_page.dart';
import 'package:hakaton_uic/utils/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});
  static const routeName = '/';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int currentIndex = 0;
  List pages = [
    const HomePage(),
    const SearchPage(),
    const CategoriesPage(),
    BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthLoaded) {
          if (state.isAuthinticated) {
            return const ProfilePage();
          } else {
            return const UnAuthPage();
          }
        }
        return const SizedBox();
      },
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: WillPopScope(
        onWillPop: () async => true,
        child: SizedBox(
          height: 60,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex,
              selectedItemColor: kBlack,
              selectedLabelStyle:
                  TextStyle(color: kBlack, fontWeight: FontWeight.w600),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              unselectedItemColor: kGreyTextColor,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              elevation: 0.5,
              backgroundColor: kWhite,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/home.svg",
                      color: currentIndex == 0 ? kPrimaryColor : kGreyTextColor,
                    ),
                    label: "main".tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/search.svg",
                      color: currentIndex == 1 ? kPrimaryColor : kGreyTextColor,
                    ),
                    label: "search".tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/category.svg",
                      color: currentIndex == 2 ? kPrimaryColor : kGreyTextColor,
                    ),
                    label: "categories".tr()),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      "assets/svg/profile.svg",
                      color: currentIndex == 3 ? kPrimaryColor : kGreyTextColor,
                    ),
                    label: "profile".tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
