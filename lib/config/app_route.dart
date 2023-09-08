import 'package:flutter/material.dart';
import 'package:hakaton_uic/precentation/auth_pages/registration_page.dart';
import 'package:hakaton_uic/precentation/auth_pages/login_page.dart';
import 'package:hakaton_uic/precentation/auth_pages/success_page.dart';
import 'package:hakaton_uic/precentation/pages/add_product_page.dart';
import 'package:hakaton_uic/precentation/pages/my_products_page.dart';
import 'package:hakaton_uic/precentation/pages/product_detail_page.dart';
import 'package:hakaton_uic/precentation/pages/profile_setting_page.dart';
import 'package:hakaton_uic/precentation/pages/terms_of_use_page.dart';
import 'package:hakaton_uic/precentation/widgets/category_widgets/category_detail.dart';
import 'package:hakaton_uic/precentation/widgets/category_widgets/category_sub_detail.dart';
import 'package:hakaton_uic/precentation/widgets/category_widgets/subcategory_detail.dart';
import '../precentation/pages/home_page.dart';

class AppRoute {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      case LoginPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginPage(),
        );
      case RegistrationPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const RegistrationPage(),
        );
      case SuccessPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SuccessPage(),
        );
      case CategoryDetail.routeName:
        return MaterialPageRoute(
          builder: (context) => CategoryDetail(categories: []),
        );
      case CategorySubDetail.routeName:
        return MaterialPageRoute(
          builder: (context) =>
              const CategorySubDetail(title: '', subtitle: ''),
        );
      case SubcategoryDetail.routeName:
        return MaterialPageRoute(
          builder: (context) => const SubcategoryDetail(title: ''),
        );
      case ProductDetailPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ProductDetailPage(),
        );
      case ProfileSettingPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ProfileSettingPage(),
        );
      case MyPostsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyPostsPage(),
        );
      case AddProductPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const AddProductPage(),
        );
      case TermsOfUsePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const TermsOfUsePage(),
        );
      default:
        break;
    }
    return null;
  }
}
