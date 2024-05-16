import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vmake/screens/playing_video_screen.dart';

class SearchVideosScreen extends StatefulWidget {
  String title;
  String searchtext = "";
  SearchVideosScreen(
      {super.key, required this.title, required this.searchtext});

  @override
  State<SearchVideosScreen> createState() => _SearchVideosScreenState();
}

class _SearchVideosScreenState extends State<SearchVideosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search for ${widget.title}"),
      ),
      body: widget.searchtext == 'category'
          ? FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('videos')
                  .where('category', isGreaterThanOrEqualTo: widget.title)
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return ListView.builder(
                      itemCount: (snapshot.data as dynamic).docs.length,
                      itemBuilder: (context, index) {
                        final snap = (snapshot.data as dynamic).docs[index];
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: 400,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  print(widget.searchtext);
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => PlayingVideoScreen(
                                            url: snap['videoUrl'],
                                            title: snap['titleName'],
                                          )));
                                },
                                child: Image(
                                  image: NetworkImage(snap['thumbnail']),
                                  height: 240,
                                  width: MediaQuery.of(context).size.width,
                                ),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Title: " + snap['titleName'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Category: " + snap['category'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    " Description: " + snap['description'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Location: " + snap['video location'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Divider(
                                thickness: 3,
                                color: Colors.black,
                              )
                            ],
                          ),
                        );
                      });
                }
              })
          : widget.searchtext == 'location'
              ? FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('videos')
                      .where('video location',
                          isGreaterThanOrEqualTo: widget.title)
                      .get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: (snapshot.data as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            final snap = (snapshot.data as dynamic).docs[index];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print(widget.searchtext);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayingVideoScreen(
                                                    url: snap['videoUrl'],
                                                    title: snap['titleName'],
                                                  )));
                                    },
                                    child: Image(
                                      image: NetworkImage(snap['thumbnail']),
                                      height: 240,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Title: " + snap['titleName'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Category: " + snap['category'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Description: " + snap['description'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Location: " + snap['video location'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 3,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  })
              : FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('videos')
                      .where('titleName', isGreaterThanOrEqualTo: widget.title)
                      .get(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                          itemCount: (snapshot.data as dynamic).docs.length,
                          itemBuilder: (context, index) {
                            final snap = (snapshot.data as dynamic).docs[index];
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 400,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      print(widget.searchtext);
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PlayingVideoScreen(
                                                    url: snap['videoUrl'],
                                                    title: snap['titleName'],
                                                  )));
                                    },
                                    child: Image(
                                      image: NetworkImage(snap['thumbnail']),
                                      height: 240,
                                      width: MediaQuery.of(context).size.width,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Title: " + snap['titleName'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Category: " + snap['category'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        " Description: " + snap['description'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Location: " + snap['video location'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    thickness: 3,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            );
                          });
                    }
                  }),
    );
  }
}
