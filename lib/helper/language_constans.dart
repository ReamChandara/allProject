import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String _languageCode = 'languageCode';
const String english = "en";
const String khmer = 'km';
const String chiness = 'zh';

Future<Locale> setLocale(String languageCode) async {
  var prefs = await SharedPreferences.getInstance();
  await prefs.setString(_languageCode, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  var prefs = await SharedPreferences.getInstance();
  String languageCode = prefs.getString(_languageCode) ?? english;
  print("lang code : $languageCode");
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case english:
      return const Locale(english, "EN");
    case khmer:
      return const Locale(khmer, "KH");
    case chiness:
      return const Locale(chiness, "CH");
    default:
      return const Locale(english, "EN");
  }
}

AppLocalizations transtation(BuildContext context) {
  return AppLocalizations.of(context);
}
