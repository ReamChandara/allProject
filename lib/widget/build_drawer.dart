import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/calculator_page.dart';
import 'package:flutter_application_1/page/convert_base_page.dart';
import 'package:flutter_application_1/page/scanner_page.dart';
import 'package:flutter_application_1/page/tamperature_page.dart';
import 'package:flutter_application_1/widget/drawer_header.dart';

import 'list_drawer.dart';

class DrawerWidget extends StatefulWidget {
  final int selected;
  const DrawerWidget({this.selected = 1});
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      HeaderDrawer(),
                      ListDrawer(
                        label: "Calculator",
                        selected: widget.selected == 1,
                        leading: Icons.calculate,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const CalculatorPage()),
                            (route) => false,
                          );
                        },
                      ),
                      ListDrawer(
                        label: "Temperature",
                        selected: widget.selected == 2,
                        leading: Icons.device_thermostat,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const TemperaturePage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      ListDrawer(
                        label: "Convert Base",
                        selected: widget.selected == 3,
                        leading: Icons.compare_arrows,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ConvertBasePage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                      ListDrawer(
                        label: "Scanner",
                        selected: widget.selected == 4,
                        leading: Icons.document_scanner_outlined,
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const ScannerPage(),
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 50.0,
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(
                  'Version : 1.0.0  Updated : 07-10-2022',
                  style: TextStyle(fontSize: 13.0),
                ),
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border.symmetric(
                  vertical: BorderSide.none,
                  horizontal: BorderSide(width: 0.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
