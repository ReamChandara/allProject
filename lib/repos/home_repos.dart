import 'package:flutter_application_1/models/post.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

import '../models/random.dart';

Future<List<User>> getData() async {
  String url = "https://jsonplaceholder.typicode.com/posts";
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(userFromJson, response.body);
  } else {
    throw Exception("error code ${response.statusCode}");
  }
}

Future<Random> getRandom() async {
  String url = "https://randomuser.me/api";
  http.Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return compute(randomFromJson, response.body);
  } else {
    throw Exception("Error code ${response.statusCode}");
  }
}
// List<User> _convet(String data){
//   List<User> userList = userFromJson(data);
//   return userList;
// }