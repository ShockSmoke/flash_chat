import 'package:flash_chat/components/button.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;

  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration:
                  kInputFieldDecoration.copyWith(hintText: "Enter your Email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                            style: TextStyle(color: Colors.black),

                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                onChanged: (value) {
                  password = value;
                },
                decoration: kInputFieldDecoration.copyWith(
                    hintText: "Enter your password"),),
            SizedBox(
              height: 24.0,
            ),
            Button(
              onpressed: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newUser != null)
                    Navigator.pushNamed(context, ChatScreen.id);
                } catch (e) {
                  print(e);
                }
              },
              text: "Register",
            )
          ],
        ),
      ),
    );
  }
}
