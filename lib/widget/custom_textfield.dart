import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String leading;
  final String number;
  final String currency;
  final bool isReadOnly;
  final bool isFocus;
  final TextInputType textInputType;
  final String hintext;
  final Color color;
  final Function(String) onChange;
  final Function onPress;
  final TextEditingController controller;

  const CustomTextField({
    Key key,
    this.leading,
    this.number,
    this.currency,
    this.isReadOnly,
    this.controller,
    this.isFocus,
    this.hintext,
    this.color,
    this.onChange,
    this.textInputType,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController(text: '0.00');
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 10.0),
      child: Container(
        height: 60,
        width: double.infinity,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5),
        //   color: color ?? Colors.white,
        //   border: Border.all(width: 0.1),
        //   boxShadow: const [
        //     BoxShadow(
        //       blurRadius: 2,
        //       spreadRadius: 0,
        //       color: Colors.grey,
        //       offset: Offset(0, 3),
        //     ),
        //   ],
        // ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 8),
            Flexible(
              child: SizedBox(
                width: double.infinity,
                child: Text(leading, style: const TextStyle(fontSize: 16)) ??
                    const Text('Label', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(width: 5),
            Flexible(
              flex: 2,
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: TextField(
                  onTap: onPress,
                  onChanged: onChange,
                  keyboardType: TextInputType.number,
                  // autofocus: isFocus ?? false,
                  readOnly: isReadOnly ?? true,
                  controller: controller ?? _controller,
                  style: const TextStyle(fontSize: 18),
                  decoration: InputDecoration(
                      hintStyle:
                          const TextStyle(fontSize: 18, color: Colors.black),
                      hintText: hintext,
                      border: const OutlineInputBorder()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
