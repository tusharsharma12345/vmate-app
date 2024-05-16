import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:video_player/video_player.dart';
import 'package:vmake/controller.dart/upload_video_controller.dart';
import 'package:vmake/utils/snackbar.dart';
import 'package:vmake/utils/text_input_field.dart';

import '../controller.dart/location.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;

  const ConfirmScreen(
      {super.key, required this.videoFile, required this.videoPath});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  bool linearpheight = false;
  late VideoPlayerController controller;
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  double? latitute;
  double? longitute;
  String videolocation = "None";

  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
    getCountry();
  }

  getCountry() async {
    Locatione locatione = Locatione();
    await locatione.getCurrentlocation();
    longitute = locatione.longitute;
    latitute = locatione.latitute;
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitute!, longitute!);
    videolocation = placemark[0].country!;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(videolocation),
        actions: [
          IconButton(
              onPressed: () {
                getCountry();
              },
              icon: Icon(Icons.location_pin)),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          linearpheight
              ? LinearProgressIndicator(
                  minHeight: 5,
                )
              : const SizedBox(
                  height: 30,
                ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            child: VideoPlayer(controller),
          ),
          SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _titleController,
                    labelText: 'Title',
                    icon: Icons.music_note,
                    isobscure: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _descriptionController,
                    labelText: 'Description',
                    icon: Icons.closed_caption,
                    isobscure: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextInputField(
                    controller: _categoryController,
                    labelText: 'Category',
                    icon: Icons.closed_caption,
                    isobscure: false,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      if (videolocation != "None" &&
                          _titleController.text.isNotEmpty &&
                          _categoryController.text.isNotEmpty &&
                          _descriptionController.text.isNotEmpty) {
                        linearpheight = true;
                        await uploadVideoController.uploadVideo(
                            _titleController.text,
                            _descriptionController.text,
                            _categoryController.text,
                            videolocation,
                            widget.videoPath);
                        linearpheight = false;
                      } else {
                        showSnackBar(
                            context: context,
                            content:
                                "Please tap on location icon to get location and enter all fields.");
                      }
                    },
                    child: Text(
                      'Share',
                      style: TextStyle(
                          fontSize: 20, color: Colors.lightBlueAccent),
                    ))
              ],
            ),
          )
        ],
      )),
    );
  }
}
