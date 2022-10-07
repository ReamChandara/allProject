import 'package:flutter/material.dart';

import '../../widget/build_button.dart';

class RotaleCalculatePage extends StatefulWidget {
  const RotaleCalculatePage({Key key}) : super(key: key);

  @override
  State<RotaleCalculatePage> createState() => _RotaleCalculatePageState();
}

class _RotaleCalculatePageState extends State<RotaleCalculatePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar,
      body: buildBody,
    );
  }

  get buildAppbar {
    return AppBar(
      title: const Text("Calculator"),
    );
  }

  get buildBody {
    return Column(
      children: [
        Expanded(child: Container()),
        const Divider(),
        Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        buildButtom("("),
                        buildButtom(")"),
                        buildButtom("x^2"),
                        buildButtom("m+"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButtom("m-"),
                        buildButtom("mr"),
                        buildButtom("6"),
                        buildButtom("X"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButtom("1"),
                        buildButtom("2"),
                        buildButtom("3"),
                        buildButtom("-"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButtom("."),
                        buildButtom("0"),
                        buildButtom("00"),
                        buildButtom("+"),
                      ],
                    ),
                    Row(
                      children: [
                        buildButtom("CLEAR"),
                        buildButtom("="),
                      ],
                    ),
                  ],
                )),
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildButtom("7"),
                          buildButtom("8"),
                          buildButtom("9"),
                          buildButtom("/"),
                        ],
                      ),
                      Row(
                        children: [
                          buildButtom("4"),
                          buildButtom("5"),
                          buildButtom("6"),
                          buildButtom("X"),
                        ],
                      ),
                      Row(
                        children: [
                          buildButtom("1"),
                          buildButtom("2"),
                          buildButtom("3"),
                          buildButtom("-"),
                        ],
                      ),
                      Row(
                        children: [
                          buildButtom("."),
                          buildButtom("0"),
                          buildButtom("00"),
                          buildButtom("+"),
                        ],
                      ),
                      Row(
                        children: [
                          buildButtom("CLEAR"),
                          buildButtom("="),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ],
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
          padding: const EdgeInsets.all(16),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
