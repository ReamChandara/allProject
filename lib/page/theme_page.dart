import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/language_constans.dart';
import 'package:flutter_application_1/theme/theme_service.dart';
import 'package:get/get.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

enum theme { light, dark }

class _ThemePageState extends State<ThemePage> {
  theme select;
  String saveTheme = "";
  void getTheme() async {
    await ThemeService().getTheme().then((value) {
      saveTheme = value;
      if (saveTheme == "light") {
        setState(() {
          select = theme.light;
        });
      } else {
        setState(() {
          select = theme.dark;
        });
      }
    });
  }

  @override
  void initState() {
    getTheme();
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
      title: Text(transtation(context).changetheme),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListTile(
            onTap: () {
              setState(() {
                select = theme.light;
                // print(select.name);
              });
              ThemeService().changeThemeMode(ThemeMode.light, select.name);
            },
            title: const Text("Ligth Mode"),
            leading: Radio(
              value: theme.light,
              groupValue: select,
              onChanged: (theme value) {
                setState(() {
                  select = value;
                  //print(value.name);
                });
                ThemeService().changeThemeMode(ThemeMode.light, value.name);
              },
            ),
          ),
          const Divider(
            color: Colors.black,
            indent: 20,
          ),
          ListTile(
            onTap: () {
              setState(() {
                select = theme.dark;
                //print(select.name);
              });
              ThemeService().changeThemeMode(ThemeMode.dark, select.name);
            },
            title: const Text('Dark mode'),
            leading: Radio(
              value: theme.dark,
              groupValue: select,
              onChanged: (theme value) {
                setState(() {
                  select = value;
                  // print(value.name);
                });
                ThemeService().changeThemeMode(ThemeMode.dark, value.name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
