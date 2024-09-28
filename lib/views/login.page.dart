// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  Future<void> sigIn(BuildContext context) async {
    try {
      // FirebaseAuth.instance.sendPasswordResetEmail(email: txtEmail.text);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );
      // Navigator.pushReplacementNamed(context, '/chats');
    } on FirebaseAuthException catch (ex) {
      var snackBar = SnackBar(
        content: Text(ex.message ?? 'Erro inexperado!!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFACACC7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: txtEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFFACACC7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextField(
                  controller: txtPassword,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                margin: EdgeInsets.only(top: 68),
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Color(0xFF002DE3),
                    ),
                  ),
                  child: Text(
                    "login",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => sigIn(context),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/new-account');
                  },
                  child: Text("Don't have an account? Create one!"))
            ]),
      ),
    );
  }
}
