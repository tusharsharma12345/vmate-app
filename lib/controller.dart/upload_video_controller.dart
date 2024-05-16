import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:vmake/utils/snackbar.dart';

import '../const.dart';
import '../models/video.dart';

class UploadVideoController extends GetxController {
  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.LowQuality,
    );
    return compressedVideo!.file;
  }

  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  uploadVideo(String titleName, String description, String category,
      String videolocation, String videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      var allDoc = await firestore.collection('videos').get();
      int len = allDoc.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);

      Video video = Video(
        uid: uid,
        id: "Video $len",
        titleName: titleName,
        description: description,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        category: category,
        videolocation: videolocation,
      );
      await firestore
          .collection('videos')
          .doc('Video $len')
          .set(video.toJson());
      Get.back();
      
    } catch (e) {
      Get.snackbar('Error Uploading Video', e.toString());
    }
  }
}
