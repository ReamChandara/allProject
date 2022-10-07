import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/create_student_page.dart';
import 'package:flutter_application_1/page/detail_student_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../helper/utility.dart';
import '../models/student.dart';
import '../repos/my_repos.dart';

class ShowStudent extends StatefulWidget {
  const ShowStudent({Key key}) : super(key: key);

  @override
  State<ShowStudent> createState() => _ShowStudentState();
}

class _ShowStudentState extends State<ShowStudent> {
  Future<List<Student>> studentList;
  String image =
      "https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg";
  Future<void> initDb() async {
    createDb().then((value) {
      setState(() {
        studentList = getStudentList();
      });
    });
  }

  @override
  void initState() {
    initDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
      floatingActionButton: _buildfoatingButton,
    );
  }

  get _buildfoatingButton {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const CreateStudentPage(),
          ),
        );
        // Navigator.pop(context);
      },
      child: const Icon(Icons.add),
    );
  }

  get _buildAppbar {
    return AppBar(
      centerTitle: true,
      title: const Text("Student"),
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<List<Student>>(
          future: studentList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Erorr while loading ${snapshot.error}"),
              );
            } else {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return buildStudentList(snapshot.data);
                } else {
                  return const Center(
                    child: Text("No data"),
                  );
                }
              } else {
                return SpinKitFadingCircle(
                  color: Theme.of(context).primaryColor,
                );
              }
            }
          }),
    );
  }

  Widget buildStudentList(List<Student> students) {
    return ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          var student = students[index];
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailStudent(student: student)));
              },
              leading: student.image == null || student.image.isEmpty
                  ? Image.network(
                      image,
                    )
                  : Utility.imageFromBase64String(student.image),
              title: Text(student.name ?? "hello"),
              subtitle: Text(student.age.toString()),
              trailing: IconButton(
                  onPressed: () async {
                    await delete(student.id);
                    setState(() {
                      studentList = getStudentList();
                    });
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          );
        });
  }
}
