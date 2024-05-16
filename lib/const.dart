import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:vmake/screens/add_video_screen.dart';
import 'package:vmake/screens/explore_screen.dart';
import 'package:vmake/screens/profile_screen.dart';


var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;
List pages =
   [ 
  ExploreScreen(),
  AddVideoScreen(),
  ProfileScreen(),
];
