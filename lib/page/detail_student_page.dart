import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/show_student.dart';
import 'package:image_picker/image_picker.dart';

import '../helper/utility.dart';
import '../models/student.dart';
import '../repos/my_repos.dart';

class DetailStudent extends StatefulWidget {
  final Student student;
  const DetailStudent({Key key, @required this.student}) : super(key: key);

  @override
  State<DetailStudent> createState() => _DetailStudentState();
}

class _DetailStudentState extends State<DetailStudent> {
  var nameController = TextEditingController(text: "");
  var ageController = TextEditingController(text: "");
  final scaffoldState = GlobalKey<ScaffoldState>();
  String imgString;
  String image =
      "https://cdn.vectorstock.com/i/preview-1x/48/06/image-preview-icon-picture-placeholder-vector-31284806.jpg";
  int uId = 0;
  pickImageFromGallery() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
      imgString = Utility.base64String(await imgFile.readAsBytes());
      print(imgString);
      setState(() {});

      // photo photo1 = photo(0, imgString);
      // dbHelper.save(photo1);
      // refreshImages();
    });
  }

  pickImageFromCamera() {
    ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((imgFile) async {
      imgString = Utility.base64String(await imgFile.readAsBytes());
      print(imgString);
      setState(() {});

      // photo photo1 = photo(0, imgString);
      // dbHelper.save(photo1);
      // refreshImages();
    });
  }

  @override
  void initState() {
    uId = widget.student.id;
    nameController.text = widget.student.name;
    ageController.text = widget.student.age.toString();
    imgString = widget.student.image;
    super.initState();
  }

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
                      Student s = Student(
                        id: uId,
                        name: nameController.text,
                        age: int.parse(ageController.text),
                        image: imgString,
                      );

                      await update(s.toMap(), uId);
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
                      child: const Text("Update"),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Expanded(child: _buildBody)
                ],
              ),
            ),
          ),
        ));
  }

  get _buildAppBar {
    return AppBar(
      centerTitle: true,
      title: const Text("detail Student"),
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
                        pickImageFromCamera();
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
                      pickImageFromGallery();
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
}
