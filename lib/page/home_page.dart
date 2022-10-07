import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/random.dart';
import 'package:flutter_application_1/repos/home_repos.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:developer' as devloper;

import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: _buildBody,
    );
  }

  Widget builCard(Random random) {
    return Center(
      child: Card(
          color: Colors.grey[200],
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(random.results.first.picture.medium),
                  maxRadius: 70,
                ),
                const Text(
                  "Hi, My name is",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                Text(
                  "${random.results.first.name.first} ${random.results.first.name.last}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )),
    );
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder<Random>(
          future: getRandom(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong!"),
              );
            } else {
              if (snapshot.connectionState == ConnectionState.done) {
                return builCard(snapshot.data);
              } else {
                return Center(
                    child: SpinKitFadingCircle(
                  color: Theme.of(context).primaryColor,
                ));
              }
            }
          }),
    );
  }

  Widget buildList(List<User> userList) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.people),
              title: Text(userList[index].title),
              subtitle: Text(userList[index].body),
            ),
          );
        });
  }
}
