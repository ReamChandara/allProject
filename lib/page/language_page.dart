import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/language_constans.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

enum language {
  en,
  km,
  zh,
}

class _LanguagePageState extends State<LanguagePage> {
  language select = language.en;

  Future<void> getLanguage() async {
    var pref = await SharedPreferences.getInstance();
    var languages = pref.getString("languageCode");
    if (languages == "en") {
      setState(() {
        select = language.en;
      });
    } else if (languages == "km") {
      setState(() {
        select = language.km;
      });
    } else {
      setState(() {
        select = language.zh;
      });
    }
  }

  @override
  void initState() {
    getLanguage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(transtation(context).changelang),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            onTap: () async {
              setState(() {
                select = language.en;
              });
              Locale _locale = await setLocale(select.name);
              MyApp.setLocale(context, _locale);
            },
            title: const Text("English"),
            leading: Radio(
              value: language.en,
              groupValue: select,
              onChanged: (language value) async {
                setState(() {
                  select = value;
                });
                Locale _locale = await setLocale(value.name);
                MyApp.setLocale(context, _locale);
              },
            ),
          ),
          const Divider(
            color: Colors.black,
            indent: 20,
          ),
          ListTile(
            onTap: () async {
              setState(() {
                select = language.km;
              });
              Locale _locale = await setLocale(select.name);
              MyApp.setLocale(context, _locale);
            },
            title: const Text('ភាសាខ្មែរ'),
            leading: Radio(
              value: language.km,
              groupValue: select,
              onChanged: (language value) async {
                setState(() {
                  select = value;
                });
                Locale _locale = await setLocale(value.name);
                MyApp.setLocale(context, _locale);
              },
            ),
          ),
          const Divider(
            color: Colors.black,
            indent: 20,
          ),
          ListTile(
            onTap: () async {
              setState(() {
                select = language.zh;
              });
              Locale _locale = await setLocale(select.name);
              MyApp.setLocale(context, _locale);
            },
            title: const Text('中國人'),
            leading: Radio(
              value: language.zh,
              groupValue: select,
              onChanged: (language value) async {
                setState(() {
                  select = value;
                });
                Locale _locale = await setLocale(value.name);
                MyApp.setLocale(context, _locale);
              },
            ),
          ),
        ],
      ),
    );
  }
}
