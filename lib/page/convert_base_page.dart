import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/language_constans.dart';
import 'package:flutter_application_1/widget/build_button.dart';
import 'package:flutter_application_1/widget/build_drawer.dart';

import '../widget/build_dropdow.dart';

class ConvertBasePage extends StatefulWidget {
  const ConvertBasePage({Key key}) : super(key: key);

  @override
  State<ConvertBasePage> createState() => _ConvertBasePageState();
}

class _ConvertBasePageState extends State<ConvertBasePage> {
  String name = "";
  List<String> base = [
    "2 (Binary)",
    "8 (Octal)",
    "10 (Decimal)",
    "16 (Hex)",
  ];
  String fromBase;
  String toBase;
  bool warning = false;
  bool click = true;
  TextEditingController numberCon = TextEditingController(text: "");
  TextEditingController resultCon = TextEditingController(text: "");
  // convert decimal
  void convertdecToBin(String number) {
    int decimal = int.parse(number);
    String bin = decimal.toRadixString(2);
    setState(() {
      resultCon.text = bin;
    });
  }

  void convertDecToOctal(String number) {
    int decimal = int.parse(number);
    String octal = decimal.toRadixString(8);
    setState(() {
      resultCon.text = octal;
    });
  }

  void convertDecToHex(String number) {
    int decimal = int.parse(number);
    String hex = decimal.toRadixString(16);
    setState(() {
      resultCon.text = hex.toUpperCase();
    });
  }

  // end convert
  // convert binary
  void convertBinToDec(String number) {
    int decimal = int.parse(number, radix: 2);
    setState(() {
      resultCon.text = decimal.toString();
    });
  }

  void convertBinToOctal(String number) {
    int decimal = int.parse(number, radix: 2);
    String octal = decimal.toRadixString(8);
    setState(() {
      resultCon.text = octal;
    });
  }

  void convertBinToHex(String number) {
    int decimal = int.parse(number, radix: 2);
    String hex = decimal.toRadixString(16);
    setState(() {
      resultCon.text = hex.toUpperCase();
    });
  }

  // end binary
  // convert octal
  void convertOctalToDec(String number) {
    int decimal = int.parse(number, radix: 8);
    setState(() {
      resultCon.text = decimal.toString();
    });
  }

  void convertOctalToBin(String number) {
    int decimal = int.parse(number, radix: 8);
    String bin = decimal.toRadixString(2);
    setState(() {
      resultCon.text = bin;
    });
  }

  void convertOctalToHex(String number) {
    int decimal = int.parse(number, radix: 8);
    String hex = decimal.toRadixString(16);
    setState(() {
      resultCon.text = hex.toUpperCase();
    });
  }

  //convert hex
  void convertHexToDec(String number) {
    int hex = int.parse(number, radix: 16);
    setState(() {
      resultCon.text = hex.toString().toUpperCase();
    });
  }

  void convertHexToBin(String number) {
    int decimal = int.parse(number, radix: 16);
    String bin = decimal.toRadixString(2);
    setState(() {
      resultCon.text = bin.toUpperCase();
    });
  }

  void convertHexToOctal(String number) {
    int decimal = int.parse(number, radix: 16);
    String octal = decimal.toRadixString(8);
    setState(() {
      resultCon.text = octal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(
        selected: 3,
      ),
      appBar: buildAppbar,
      body: buildBody,
    );
  }

  get buildAppbar {
    return AppBar(
      title: Text(transtation(context).convertbase),
    );
  }

  get buildBody {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: numberCon,
                    onChanged: (value) {
                      if (numberCon.text.isNotEmpty) {
                        setState(() {
                          click = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      filled: warning,
                      fillColor: Colors.red[100],
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "From Base",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdownButton2(
                    icon: const Icon(
                      Icons.expand_more,
                      size: 20,
                    ),
                    buttonHeight: 60,
                    buttonWidth: double.infinity,
                    itemHeight: 60,
                    hint: 'Select Base',
                    dropdownItems: base,
                    value: fromBase,
                    onChanged: (value) {
                      setState(() {
                        fromBase = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "To Base",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomDropdownButton2(
                    icon: const Icon(
                      Icons.expand_more,
                      size: 20,
                    ),
                    // dropdownWidth: double.infinity,
                    buttonHeight: 60,
                    buttonWidth: double.infinity,
                    itemHeight: 60,
                    hint: 'Select Base',
                    dropdownItems: base,
                    value: toBase,
                    onChanged: (value) {
                      setState(() {
                        toBase = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      click
                          ? BuildButton(
                              onPress: () {
                                if (numberCon.text.isEmpty ||
                                    fromBase == null ||
                                    toBase == null) {
                                  setState(() {
                                    click = false;
                                  });
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //     const SnackBar(
                                  //         content:
                                  //             Text("Please enter and select")));
                                } else {
                                  var exp = RegExp(r'^[0-9]+$')
                                      .hasMatch(numberCon.text);
                                  if (exp) {
                                    if (fromBase == "10 (Decimal)" &&
                                        toBase == "2 (Binary)") {
                                      convertdecToBin(numberCon.text);
                                    } else if (fromBase == "10 (Decimal)" &&
                                        toBase == "8 (Octal)") {
                                      convertDecToOctal(numberCon.text);
                                    } else if (fromBase == "10 (Decimal)" &&
                                        toBase == "16 (Hex)") {
                                      convertDecToHex(numberCon.text);
                                    } else if (fromBase == "2 (Binary)" &&
                                        toBase == "10 (Decimal)") {
                                      convertBinToDec(numberCon.text);
                                    } else if (fromBase == "2 (Binary)" &&
                                        toBase == "8 (Octal)") {
                                      convertBinToOctal(numberCon.text);
                                    } else if (fromBase == "2 (Binary)" &&
                                        toBase == "16 (Hex)") {
                                      convertBinToHex(numberCon.text);
                                    } else if (fromBase == "8 (Octal)" &&
                                        toBase == "10 (Decimal)") {
                                      convertOctalToDec(numberCon.text);
                                    } else if (fromBase == "8 (Octal)" &&
                                        toBase == "2 (Binary)") {
                                      convertOctalToBin(numberCon.text);
                                    } else if (fromBase == "8 (Octal)" &&
                                        toBase == "16 (Hex)") {
                                      convertOctalToHex(numberCon.text);
                                    } else if (fromBase == "16 (Hex)" &&
                                        toBase == "10 (Decimal)") {
                                      convertHexToDec(numberCon.text);
                                    } else if (fromBase == "16 (Hex)" &&
                                        toBase == "2 (Binary)") {
                                      convertHexToBin(numberCon.text);
                                    } else if (fromBase == "16 (Hex)" &&
                                        toBase == "8 (Octal)") {
                                      convertHexToOctal(numberCon.text);
                                    }
                                  } else {
                                    if (fromBase == "16 (Hex)") {
                                      if (fromBase == "10 (Decimal)" &&
                                          toBase == "2 (Binary)") {
                                        convertdecToBin(numberCon.text);
                                      } else if (fromBase == "10 (Decimal)" &&
                                          toBase == "8 (Octal)") {
                                        convertDecToOctal(numberCon.text);
                                      } else if (fromBase == "10 (Decimal)" &&
                                          toBase == "16 (Hex)") {
                                        convertDecToHex(numberCon.text);
                                      } else if (fromBase == "2 (Binary)" &&
                                          toBase == "10 (Decimal)") {
                                        convertBinToDec(numberCon.text);
                                      } else if (fromBase == "2 (Binary)" &&
                                          toBase == "8 (Octal)") {
                                        convertBinToOctal(numberCon.text);
                                      } else if (fromBase == "2 (Binary)" &&
                                          toBase == "16 (Hex)") {
                                        convertBinToHex(numberCon.text);
                                      } else if (fromBase == "8 (Octal)" &&
                                          toBase == "10 (Decimal)") {
                                        convertOctalToDec(numberCon.text);
                                      } else if (fromBase == "8 (Octal)" &&
                                          toBase == "2 (Binary)") {
                                        convertOctalToBin(numberCon.text);
                                      } else if (fromBase == "8 (Octal)" &&
                                          toBase == "16 (Hex)") {
                                        convertOctalToHex(numberCon.text);
                                      } else if (fromBase == "16 (Hex)" &&
                                          toBase == "10 (Decimal)") {
                                        convertHexToDec(numberCon.text);
                                      } else if (fromBase == "16 (Hex)" &&
                                          toBase == "2 (Binary)") {
                                        convertHexToBin(numberCon.text);
                                      } else if (fromBase == "16 (Hex)" &&
                                          toBase == "8 (Octal)") {
                                        convertHexToOctal(numberCon.text);
                                      }
                                      setState(() {
                                        warning = false;
                                      });
                                    } else {
                                      setState(() {
                                        warning = true;
                                      });
                                    }
                                  }
                                }
                              },
                              text: "Convert",
                            )
                          : const SizedBox(),
                      click == false
                          ? BuildButton(
                              onPress: () {
                                setState(() {
                                  click = true;
                                });
                                // setState(() {
                                //   numberCon.text = "";
                                //   resultCon.text = "";
                                // });
                              },
                              text: "Convert",
                            )
                          : const SizedBox(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Result number",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: resultCon,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
