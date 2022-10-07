import 'package:flutter/material.dart';

class Student {
  final int id;
  final String name;
  final int age;
  final String image;
  Student(
      {@required this.id,
      @required this.name,
      @required this.age,
      @required this.image});

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
        id: map["id"], name: map["name"], age: map["age"], image: map['image']);
  }

  Map<String, dynamic> toMap() =>
      {"id": id, "name": name, "age": age, "image": image};
}
