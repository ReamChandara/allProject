import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/language_constans.dart';
import 'package:flutter_application_1/page/language_page.dart';
import 'package:flutter_application_1/page/theme_page.dart';

import '../widget/build_drawer.dart';
import '../widget/list_drawer.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(
        selected: 5,
      ),
      appBar: buildAppbar,
      body: buildBody,
    );
  }

  get buildAppbar {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(transtation(context).setting),
    );
  }

  get buildBody {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListDrawer(
            label: transtation(context).changelang,
            leading: Icons.language,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguagePage()));
            },
          ),
          const Divider(
            indent: 20,
            color: Colors.black,
          ),
          ListDrawer(
            label: transtation(context).changetheme,
            leading: Icons.color_lens,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const ThemePage(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
