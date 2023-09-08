import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hakaton_uic/app/my_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

restartApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  var isLogined =
      (prefs.getBool('isLogined') == null) ? false : prefs.getBool('isLogined');
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale("uz", "UZ"),
        Locale("ru", "RU"),
        Locale("en", "US")
      ],
      saveLocale: true,
      fallbackLocale: const Locale("ru", "RU"),
      path: "assets/translations",
      child: MyApp(isLogined: isLogined!)));
}
