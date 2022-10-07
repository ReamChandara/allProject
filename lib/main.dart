import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/calculator_page.dart';
import 'package:flutter_application_1/page/home_page.dart';
import 'package:flutter_application_1/page/layout/rotate_caculate_page.dart';
import 'package:flutter_application_1/page/my_file_page.dart';
import 'package:flutter_application_1/page/show_student.dart';
import 'package:flutter_application_1/page/create_student_page.dart';
import 'package:flutter_application_1/responesive/responesive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: CalculatorPage());
  }
}
