import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/calculator_page.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget nomalScafold;
  final Widget rotateScafold;

  const ResponsiveLayout({Key key, this.nomalScafold, this.rotateScafold})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth <= 850) {
        return nomalScafold;
      } else {
        return rotateScafold;
      }
    }));
  }
}
