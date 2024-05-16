import 'package:flutter/material.dart';
import 'package:vmake/controller.dart/firebase_methods.dart';
import 'package:vmake/utils/snackbar.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneNumber.dispose();
  }

  void phoneSignIn() {
    if (_phoneNumber.text.isNotEmpty) {
      FirebaseMethods().phoneSignIn(context, _phoneNumber.text);
    } else {
      showSnackBar(context: context, content: "Please Enter Phone Number.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //     '      If you are getting error in login so default testing phone \n      no is +91123467890 and otp is 123456 '),
            const Text(
              "WELCOME TO",
              style: TextStyle(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const Text(
              "VMATE",
              style: TextStyle(
                  fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold),
            ),
            const Image(
              image: AssetImage('assets/images/vmakeimage.png'),
              width: 200,
              height: 200,
            ),
            SizedBox(
              width: 380,
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: TextInputType.phone,
                controller: _phoneNumber,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Phone number',
                ),
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            InkWell(
              child: Container(
                width: 380,
                height: 50,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    "Login ->",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
              onTap: phoneSignIn,
            ),
            const SizedBox(
              height: 3,
            ),
            const Text(
              "Let's Get Started",
              style: TextStyle(
                  fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
