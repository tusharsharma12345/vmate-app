import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vmake/screens/login_screen.dart';
import 'package:vmake/screens/search_video_screen.dart';
import 'package:vmake/utils/snackbar.dart';

import '../const.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  int pageIdx = 0;
  String searchfilter = "";
  showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    searchfilter = "title";
                     Navigator.of(context).pop();
                     setState(() {
                       
                     });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.title),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'Title',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    searchfilter = "category";
                     Navigator.of(context).pop();
                     setState(() {
                       
                     });
                  },
                  child: Row(
                    children: [
                      Icon(Icons.category),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'Category',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    searchfilter = "location";
                     Navigator.of(context).pop();
                     setState(() {
                       
                     });

                  },
                  child: Row(
                    children: [
                      Icon(Icons.map),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'Location',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(Icons.close),
                      Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            filled: false,
            hintText: 'Search by- ${searchfilter}',
            hintStyle: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (searchController.text.isNotEmpty) {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SearchVideosScreen(title: searchController.text, searchtext: searchfilter)));
              } else {
                showSnackBar(
                    context: context, content: "Enter title to search videos");
              }
            },
            icon: Icon(Icons.search),
            color: Colors.black,
          ),
          IconButton(
              onPressed: () {
                showOptionsDialog(context);
              },
              icon: Icon(Icons.filter_list),
              color: Colors.black),
          IconButton(
              onPressed: () {
                firebaseAuth.signOut();
                Get.offAll(() => LoginScreen());
              },
              icon: Icon(Icons.logout),
              color: Colors.black),
        ],
        elevation: 3,
      ),
      body: pages[pageIdx],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (Idx) {
            setState(() {
              pageIdx = Idx;
            });
          },
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          currentIndex: pageIdx,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: "Explore",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Upload"),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Setting",
            ),
          ]),
    );
  }
}
