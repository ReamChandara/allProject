import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  String image =
      "https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Zm9jdXN8ZW58MHx8MHx8&w=1000&q=80";
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: double.infinity,
      height: 130.0,
      padding: const EdgeInsets.only(top: 30.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListTile(
          title: const Text(
            "Ream Chandara",
            style: TextStyle(fontSize: 20.0),
          ),
          leading: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(
                width: 0.5,
              ),
              shape: BoxShape.circle,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/mypic.png")),
            ),
          ),
        ),
      ),
    );
  }
}
