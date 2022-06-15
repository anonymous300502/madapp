// ignore_for_file: unused_local_variable, avoid_print, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../firebase_options.dart';

class RegisterView extends StatefulWidget {
  RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  String error = " ";

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(" REGISTER ")),
        body: FutureBuilder(
          future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return Column(children: [
                  TextFormField(
                    autocorrect: false,
                    decoration:
                        InputDecoration(hintText: "Enter your email here"),
                    controller: _email,
                  ),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    decoration:
                        InputDecoration(hintText: "Enter your password here"),
                    controller: _password,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final email = _email.text;
                        final password = _password.text;
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: email, password: password);
                        } on FirebaseAuthException catch (e) {
                          error = e.code;
                          print(e.code);
                          setState(() {});
                        }
                      },
                      child: Text("Register")),
                  Container(
                    child: Text(error),
                  )
                ]);
              default:
                return Text("Loading...");
            }
          },
        ));
  }
}
