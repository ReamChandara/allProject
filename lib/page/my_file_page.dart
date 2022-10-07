import 'package:flutter/material.dart';
import 'package:flutter_application_1/repos/file_repos.dart';

class MyFilePage extends StatefulWidget {
  const MyFilePage({Key key}) : super(key: key);

  @override
  State<MyFilePage> createState() => _MyFilePageState();
}

class _MyFilePageState extends State<MyFilePage> {
  TextEditingController textCon = TextEditingController(text: "");
  String text = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  get _buildAppBar {
    return AppBar(
      title: const Text("My File"),
    );
  }

  get _buildBody {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              controller: textCon,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                //print(textCon.text);
                writeText(textCon.text);
              }),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 50,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "Write",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: (() {
                readText().then((value) {
                  setState(() {
                    text = value;
                  });
                });
              }),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 50,
                color: Theme.of(context).primaryColor,
                child: const Text(
                  "Read",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              color: Colors.amber,
              height: 100,
              width: double.infinity,
              child: Text(
                text,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
