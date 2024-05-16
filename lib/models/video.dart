import 'package:cloud_firestore/cloud_firestore.dart';

class Video {
  String uid;
  String id;
  String titleName;
  String description;
  String videoUrl;
  String thumbnail;
  String category;
  String videolocation;

  Video(
      {required this.uid,
      required this.id,
      required this.titleName,
      required this.description,
      required this.videoUrl,
      required this.thumbnail,
      required this.category,
      required this.videolocation});

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "id": id,
        "titleName": titleName,
        "description": description,
        "videoUrl": videoUrl,
        "thumbnail": thumbnail,
        "category": category,
        "video location": videolocation
      };

  static Video fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Video(
        uid: snapshot['uid'],
        id: snapshot['id'],
        titleName: snapshot['titleName'],
        description: snapshot['description'],
        videoUrl: snapshot['videoUrl'],
        thumbnail: snapshot['thumbnail'],
        category: snapshot['category'],
        videolocation: snapshot['videolocation']);
  }
}
