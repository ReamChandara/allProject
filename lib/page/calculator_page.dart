// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/build_drawer.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(
        selected: 1,
      ),
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: const Text("Calculator"),
    );
  }

  get _buildBody {
    return SizedBox(
      child: Column(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              alignment: Alignment.centerRight,
              child: Text(
                output,
                style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              )),
          const Expanded(child: Divider()),
          Column(
            children: [
              Row(
                children: [
                  buildButtom(
                    "7",
                  ),
                  buildButtom(
                    "8",
                  ),
                  buildButtom(
                    "9",
                  ),
                  buildButtom(
                    "/",
                  ),
                ],
              ),
              Row(
                children: [
                  buildButtom(
                    "4",
                  ),
                  buildButtom(
                    "5",
                  ),
                  buildButtom(
                    "6",
                  ),
                  buildButtom(
                    "X",
                  ),
                ],
              ),
              Row(
                children: [
                  buildButtom(
                    "1",
                  ),
                  buildButtom(
                    "2",
                  ),
                  buildButtom(
                    "3",
                  ),
                  buildButtom(
                    "-",
                  ),
                ],
              ),
              Row(
                children: [
                  buildButtom(
                    ".",
                  ),
                  buildButtom("0"),
                  buildButtom(
                    "00",
                  ),
                  buildButtom(
                    "+",
                  ),
                ],
              ),
              Row(
                children: [
                  buildButtom("CLEAR"),
                  buildButtom(
                    "=",
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  onPressButton(String textButton) {
    if (textButton == "CLEAR") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (textButton == "+" ||
        textButton == "-" ||
        textButton == "X" ||
        textButton == "/") {
      num1 = double.parse(output);
      operand = textButton;
      _output = "0";
    } else if (textButton == ".") {
      if (_output.contains(".")) {
      } else {
        _output = _output + textButton;
      }
    } else if (textButton == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    } else {
      _output = _output + textButton;
    }
    setState(() {
      print("output : $_output");
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildButtom(String text) {
    return Expanded(
      child: InkWell(
        onTap: () {
          onPressButton(text);
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[600].withOpacity(0.3))),
          padding: const EdgeInsets.all(24),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
