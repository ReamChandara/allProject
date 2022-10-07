// ignore_for_file: avoid_print, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/build_drawer.dart';

import '../widget/custom_textfield.dart';

class TemperaturePage extends StatefulWidget {
  const TemperaturePage({Key key}) : super(key: key);

  @override
  State<TemperaturePage> createState() => _TemperaturePageState();
}

class _TemperaturePageState extends State<TemperaturePage> {
  var celsiusCon = TextEditingController(text: "");
  var fahrenheitCon = TextEditingController(text: "");
  var kelvenCon = TextEditingController(text: "");
  bool readonly1 = false;
  bool readonly2 = false;
  bool readonly3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(
        selected: 2,
      ),
      appBar: buildAppbar,
      body: buildBody,
    );
  }

  void covertCalToFha(String cels) {
    double fahrenheit = double.parse(cels) * 1.8 + 32;
    setState(() {
      fahrenheitCon.text = fahrenheit.toString();
    });
  }

  void covertCalToKel(String cels) {
    double kevel = double.parse(cels) + 273.15;
    setState(() {
      kelvenCon.text = kevel.toString();
    });
  }

  void covertFhaToCel(String fha) {
    double cels = (double.parse(fha) - 32) / 1.8;
    setState(() {
      celsiusCon.text = cels.toString();
    });
  }

  void covertkelToCel(String kel) {
    double cels = double.parse(kel) - 273.15;
    setState(() {
      celsiusCon.text = cels.toString();
    });
  }

  void covertFhaTokel(String fha) {
    double kel = (double.parse(fha) + 459.67) * 5 / 9;
    setState(() {
      kelvenCon.text = kel.toString();
    });
  }

  void covertKelToFha(String kel) {
    double fha = double.parse(kel) * 9 / 5 - 459.67;
    setState(() {
      fahrenheitCon.text = fha.toString();
    });
  }

  get buildAppbar {
    return AppBar(
      title: const Text("Tempurature"),
    );
  }

  get buildBody {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                onChange: (value) {
                  if (celsiusCon.text.isNotEmpty) {
                    setState(() {
                      readonly2 = true;
                      readonly3 = true;
                    });
                  } else {
                    setState(() {
                      readonly2 = false;
                      readonly3 = false;
                    });
                  }
                },
                controller: celsiusCon,
                leading: "Celsius",
                isReadOnly: readonly1),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChange: (value) {
                if (fahrenheitCon.text.isNotEmpty) {
                  setState(() {
                    readonly1 = true;
                    readonly3 = true;
                  });
                } else {
                  setState(() {
                    readonly1 = false;
                    readonly3 = false;
                  });
                }
              },
              controller: fahrenheitCon,
              leading: "Fahrenheit",
              isReadOnly: readonly2,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                onChange: (p0) {
                  if (kelvenCon.text.isNotEmpty) {
                    setState(() {
                      readonly1 = true;
                      readonly2 = true;
                    });
                  } else {
                    setState(() {
                      readonly1 = false;
                      readonly2 = false;
                    });
                  }
                },
                controller: kelvenCon,
                leading: "Kelven",
                isReadOnly: readonly3),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                if (celsiusCon.text.isNotEmpty &&
                    kelvenCon.text.isEmpty &&
                    fahrenheitCon.text.isEmpty) {
                  covertCalToFha(celsiusCon.text);
                  covertCalToKel(celsiusCon.text);
                } else if (fahrenheitCon.text.isNotEmpty &&
                    celsiusCon.text.isEmpty &&
                    kelvenCon.text.isEmpty) {
                  covertFhaToCel(fahrenheitCon.text);
                  covertFhaTokel(fahrenheitCon.text);
                } else if (kelvenCon.text.isNotEmpty &&
                    fahrenheitCon.text.isEmpty &&
                    celsiusCon.text.isEmpty) {
                  covertKelToFha(kelvenCon.text);
                  covertkelToCel(kelvenCon.text);
                }
                // // covertCalToFha(celsiusCon.text.isEmpty ? "0" : celsiusCon.text);
                // // covertCalToKel(celsiusCon.text.isEmpty ? "0" : celsiusCon.text);
                // covertFhaToCel(fahrenheitCon.text);
              }),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text("Convert"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                celsiusCon.text = "";
                kelvenCon.text = "";
                fahrenheitCon.text = "";
                setState(() {
                  readonly1 = false;
                  readonly2 = false;
                  readonly3 = false;
                });
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).primaryColor,
                ),
                child: const Text("Clear"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class CustomeTextField extends StatelessWidget {
//   CustomeTextField({
//     Key key,
//     @required this.controller,
//     @required this.name,
//   }) : super(key: key);
//   String name;
//   TextEditingController controller = TextEditingController(text: "");

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 60,
//       child: TextFormField(
//         controller: controller,
//         keyboardType: TextInputType.number,
//         decoration: const InputDecoration(
//           border: OutlineInputBorder(),
//         ),
//       ),
//     );
//   }
// }
