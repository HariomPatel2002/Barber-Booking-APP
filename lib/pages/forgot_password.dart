import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../services/database.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  String? email;
  TextEditingController mailcontroller = new TextEditingController();
  resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email!);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password Reset Email has been sent! ",style: TextStyle(fontSize: 20.0),)));
    }on FirebaseAuthException catch(e){
      if(e.code=="User not fount "){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("No User found for that email.",style: TextStyle(fontSize: 20.0),)));
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        child: Column(
          children: [
            Container(
                alignment: Alignment.topCenter,
                child: Text(
                  "Password Recovery ",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                )),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Enter your Email",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0),
            ),SizedBox(height: 30.0,),

            Form(
              key: _formkey,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: .0),
                padding: EdgeInsets.only(left: 10.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white70, width: 2.0),
                    borderRadius: BorderRadius.circular(30)),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Enter your Email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white60,
                    ),
                    prefixIcon: Icon(
                      Icons.mail_outline,
                      color: Colors.white60,
                      size: 30.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50.0,),
            GestureDetector(
              onTap: () async{
                if(_formkey.currentState!.validate()){
                  setState(() {
                    email = mailcontroller.text;
                  });
                  resetPassword();
                }
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0XFFdf711a),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Send Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
