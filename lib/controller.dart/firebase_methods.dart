import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vmake/const.dart';
import 'package:vmake/screens/home_screen.dart';
import 'package:vmake/screens/login_screen.dart';
import 'package:vmake/utils/show_otp_dialog.dart';
import 'package:vmake/utils/snackbar.dart';

class FirebaseMethods extends GetxController{
  static FirebaseMethods instance = Get.find();
  late Rx<User?> _user;
  User get user => _user.value!;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  // login using phone number otp
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    TextEditingController codeController = TextEditingController();
    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackBar(context: context , content: e.message!);
        },
        codeSent: ((String verificationId, int? resendToken) async {
          showOTPDialog(
              context: context,
              codeController: codeController,
              onPressed: () async {
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: codeController.text.trim());
                await firebaseAuth.signInWithCredential(credential);
                Navigator.of(context).pop();
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  HomeScreen()),
                 );
              });
        }),
        codeAutoRetrievalTimeout: (String verificationId) {
          //Auto- resolution time out...
        });
  }
}
