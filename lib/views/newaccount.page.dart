// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewAccountPage extends StatelessWidget {
  final txtName = TextEditingController();
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  Future<void> createUser(BuildContext context) async {
    try {
      var userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: txtEmail.text,
        password: txtPassword.text,
      );

      await userCredential.user!.updateDisplayName(txtName.text);
      // await userCredential.user!.updatePhoneNumber(txtPhoto.text);
      // await userCredential.user!.updatePhotoURL(photo_url_from_storage);
      // await userCredential.user.delete();

      Navigator.of(context)
        ..pop()
        ..pushReplacementNamed('/chats');
    } on FirebaseAuthException catch (ex) {
      var snackBar = SnackBar(
        content: Text(ex.message ?? 'Erro inesperado!'),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Account"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(bottom: 32),
                  decoration: BoxDecoration(
                    color: Color(0xFFACACC7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Stack(
                    children: [
                      Center(child: Icon(Icons.person_outline, size: 56)),
                      Positioned(
                        bottom: 0,
                        right: 1,
                        child: Icon(Icons.add_circle, size: 24),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFACACC7),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextField(
                    controller: txtName,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      hintText: "Name",
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
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
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color(0xFF002DE3),
                      ),
                    ),
                    onPressed: () => createUser(context),
                    child: Text(
                      "Salvar",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
