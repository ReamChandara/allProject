import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/language_constans.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({Key key}) : super(key: key);

  @override
  State<ThemePage> createState() => _ThemePageState();
}

enum theme { ligth, dark }

class _ThemePageState extends State<ThemePage> {
  theme select = theme.ligth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
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
                select = theme.ligth;
              });
            },
            title: const Text("Ligth Mode"),
            leading: Radio(
              value: theme.ligth,
              groupValue: select,
              onChanged: (theme value) {
                setState(() {
                  select = value;
                });
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
              });
            },
            title: const Text('Dark mode'),
            leading: Radio(
              value: theme.dark,
              groupValue: select,
              onChanged: (theme value) {
                setState(() {
                  select = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
