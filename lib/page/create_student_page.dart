import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/show_student.dart';
import 'package:flutter_application_1/repos/my_repos.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/utility.dart';
import '../models/student.dart';

class CreateStudentPage extends StatefulWidget {
  const CreateStudentPage({Key key}) : super(key: key);

  @override
  State<CreateStudentPage> createState() => _CreateStudentPageState();
}

class _CreateStudentPageState extends State<CreateStudentPage> {
  var nameController = TextEditingController(text: "");
  var ageController = TextEditingController(text: "");
  String imgString;
  String image =
      "https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg";
  final scaffoldState = GlobalKey<ScaffoldState>();
  int uId = 0;
  Future<List<Student>> studentList;
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

  // _openGallery() async {
  //   // ignore: deprecated_member_use
  //   XFile image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   //List<int> imageBytes = image.readAsBytes();
  //   //_base64Image = base64Encode(imageBytes);
  //   // _bytesImage = Base64Decoder().convert(_base64Image);
  //   setState(() => _image = image);
  //   // setState(() => _image = image2);
  // }

  pickImage({ImageSource type = ImageSource.gallery}) {
    ImagePicker().pickImage(source: type).then((imgFile) async {
      Uint8List byteFile = await imgFile.readAsBytes();
      imgString = await compute(Utility.base64String, byteFile);
      print(" path image = $imgString");
      setState(() {});
    });
  }

  // pickImageFromGallery() {
  //   ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
  //     imgString = Utility.base64String(await imgFile.readAsBytes());
  //     print(imgString);
  //     setState(() {});
  //     // photo photo1 = photo(0, imgString);
  //     // dbHelper.save(photo1);
  //     // refreshImages();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar,
        body: SingleChildScrollView(
          child: Form(
            key: scaffoldState,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  InkWell(
                    onTap: (() {
                      showBottomSheet(context);
                    }),
                    child: Container(
                        width: 150,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imgString == null
                                ? NetworkImage(image)
                                : MemoryImage(
                                    Utility.dataFromBase64String(imgString),
                                  ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "input name"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: ageController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "input age"),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: () async {
                      Student student = Student(
                          id: DateTime.now().millisecondsSinceEpoch,
                          name: nameController.text,
                          age: int.parse(ageController.text),
                          image: imgString);
                      print(student.name);
                      print(student.age);
                      print(student.image);
                      await insert(student.toMap());

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ShowStudent()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      child: const Text("Add"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  get _buildAppBar {
    return AppBar(
      title: const Text("Student "),
    );
  }

  showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 120,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: InkWell(
                      onTap: (() {
                        pickImage(type: ImageSource.camera);
                        Navigator.pop(context);
                      }),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: const [
                            Icon(Icons.photo_camera),
                            SizedBox(
                              width: 10,
                            ),
                            Text("Camera"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ListTile(
                  //   onTap: (() {}),
                  //   leading: const Icon(Icons.photo_camera),
                  //   title: const Text("Camera"),
                  // ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  InkWell(
                    onTap: () {
                      pickImage(type: ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: const [
                          Icon(Icons.check_box_outline_blank),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                  // ListTile(
                  //   onTap: (() {}),
                  //   leading: const Icon(Icons.browse_gallery),
                  //   title: const Text("gallery"),
                  // )
                ],
              ),
            ),
          );
        });
  }

  // Widget buildStudentList(List<Student> students) {
  //   return SizedBox(
  //     child: Column(
  //       children: students.map((e) {
  //         return Card(
  //           child: ListTile(
  //             onTap: () {
  //               setState(() {
  //                 uId = e.id;
  //                 nameController.text = e.name;
  //                 ageController.text = e.age.toString();
  //               });
  //             },
  //             leading: e.image == null || e.image.isEmpty
  //                 ? Image.network(
  //                     "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
  //                   )
  //                 : Utility.imageFromBase64String(e.image),
  //             title: Text(e.name),
  //             subtitle: Text(e.age.toString()),
  //             trailing: IconButton(
  //                 onPressed: () async {
  //                   await delete(e.id);
  //                   setState(() {
  //                     studentList = getStudentList();
  //                   });
  //                 },
  //                 icon: const Icon(
  //                   Icons.delete,
  //                   color: Colors.red,
  //                 )),
  //           ),
  //         );
  //       }).toList(),
  //     ),
  //   );
  // }

  // get _buildBody {
  //   return Container(
  //     alignment: Alignment.center,
  //     child: FutureBuilder<List<Student>>(
  //         future: studentList,
  //         builder: (context, snapshot) {
  //           if (snapshot.hasError) {
  //             return Center(
  //               child: Text("Erorr while loading ${snapshot.error}"),
  //             );
  //           } else {
  //             if (snapshot.connectionState == ConnectionState.done) {
  //               if (snapshot.hasData) {
  //                 return buildStudentList(snapshot.data);
  //               } else {
  //                 return const Center(
  //                   child: Text("No data"),
  //                 );
  //               }
  //             } else {
  //               return SpinKitFadingCircle(
  //                 color: Theme.of(context).primaryColor,
  //               );
  //             }
  //           }
  //         }),
  //   );
  // }
}
// ListView.builder(
//         itemCount: student.length,
//         itemBuilder: (context, index) {
//           var students = student[index];

//           return Card(
//             child: ListTile(
//               onTap: () {
//                 setState(() {
//                   uId = students.id;
//                   nameController.text = students.name;
//                   ageController.text = students.age.toString();
//                 });
//               },
//               leading: students.image == null || students.image.isEmpty
//                   ? Image.network(
//                       "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVuc3xlbnwwfHwwfHw%3D&w=1000&q=80",
//                     )
//                   : Utility.imageFromBase64String(students.image),
//               title: Text(students.name),
//               subtitle: Text(students.age.toString()),
//               trailing: IconButton(
//                   onPressed: () async {
//                     await delete(students.id);
//                     setState(() {
//                       studentList = getStudentList();
//                     });
//                   },
//                   icon: const Icon(
//                     Icons.delete,
//                     color: Colors.red,
//                   )),
//             ),
//           );
//         });
