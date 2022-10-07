import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

String myText = 'mytext.txt';
Future<File> get _localFile async {
  final dir = await getApplicationDocumentsDirectory();
  String filePath = join(dir.path, myText);
  print(filePath);
  return File(filePath);
}

Future<void> writeText(String text) async {
  final file = await _localFile;
  file.writeAsString(text);
}

Future<String> readText() async {
  final file = await _localFile;

  return file.readAsString();
}
