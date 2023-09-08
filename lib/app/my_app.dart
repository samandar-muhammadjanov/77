// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hakaton_uic/blocs/bloc_exports.dart';
import 'package:hakaton_uic/blocs/langauge/language_bloc.dart';
import '/config/app_route.dart';
import '/config/app_theme.dart';
import '/precentation/pages/dashboard.dart';
import 'package:easy_localization/easy_localization.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isLogined});
  final bool isLogined;
  AppRoute appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthinticatedEvent(isLogined)),
        ),
        BlocProvider(
          create: (context) => ProductBloc()..add(GetProductsEvent('')),
        ),
        BlocProvider(
          create: (context) => CategoryBloc()..add(GetCategoriesEvent()),
        ),
        BlocProvider(
          create: (context) => UserBloc()..add(GetUserDataEvent(context)),
        ),
        BlocProvider(
          create: (context) => LayoutBloc(),
        ),
        BlocProvider(
          create: (context) => SearchActiveBloc(),
        ),
        BlocProvider(
          create: (context) => SearchOnchangedBloc(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc()
            ..add(
              ChangeLanguageEvent(context.locale),
            ),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: '77',
        theme: AppTheme.lightTheme,
        onGenerateRoute: appRoute.onGenerateRoute,
        home: const Dashboard(),
      ),
    );
  }
}
