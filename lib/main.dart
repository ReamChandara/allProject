import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/language_constans.dart';
import 'package:flutter_application_1/page/calculator_page.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:flutter_application_1/theme/theme_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_application_1/page/home_page.dart';
// import 'package:flutter_application_1/page/layout/rotate_caculate_page.dart';
// import 'package:flutter_application_1/page/my_file_page.dart';
// import 'package:flutter_application_1/page/show_student.dart';
// import 'package:flutter_application_1/page/create_student_page.dart';
// import 'package:flutter_application_1/responesive/responesive_layout.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode themeMode;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    await getLocale().then((value) {
      setLocale(value);
    });
    await ThemeService().getThemeMode().then((value) {
      themeMode = value;
      print(themeMode);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const CalculatorPage(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: _locale,
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: themeMode);
  }
}
