import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/helper/language_constans.dart';
import 'package:flutter_application_1/widget/build_drawer.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerPage extends StatefulWidget {
  const ScannerPage({Key key}) : super(key: key);

  @override
  State<ScannerPage> createState() => _ScannerPageState();
}

class _ScannerPageState extends State<ScannerPage> {
  var qrCodeController = TextEditingController();
  var barcodeController = TextEditingController();
  Future<void> _scanBarcode() async {
    try {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'CANCEL', true, ScanMode.BARCODE);
      if (!mounted) return;
      if (barcode.isEmpty) {
        return;
      } else {
        setState(() => barcodeController.text = barcode);
      }
    } catch (e) {
      barcodeController.text = "Scan not Success!";
    }
  }

  Future<void> _scanQr() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'CANCEL', true, ScanMode.QR);
      if (!mounted) return;
      if (qrCode.isEmpty) {
        return;
      } else {
        setState(() => qrCodeController.text = qrCode);
      }
    } catch (e) {
      qrCodeController.text = "Scan not Success!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(selected: 4),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text(transtation(context).scanner),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildEmailFormField("QRCode", "input qrcode", qrCodeController),
            const SizedBox(
              height: 30,
            ),
            buildEmailFormField("Barcode", "inputBarcode", barcodeController),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildBotton(
                  "Scan QR",
                  () {
                    _scanQr();
                  },
                ),
                buildBotton(
                  "Scan Barcode",
                  () {
                    _scanBarcode();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBotton(String text, Function() onTap) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: 150,
            alignment: Alignment.center,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).primaryColor,
            ),
            child: Text(text)));
  }

  TextFormField buildEmailFormField(
      String title, String hintText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: title,
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: controller.text));
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Copied")));
            },
            icon: const Icon(Icons.content_copy),
          )),
    );
  }
}
