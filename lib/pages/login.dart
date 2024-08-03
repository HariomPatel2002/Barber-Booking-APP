import 'dart:html';

import 'package:barbarbookingapp/pages/home.dart';
import 'package:barbarbookingapp/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String ? mail,password;
  TextEditingController emialcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();
  final _formkey = GlobalKey<FormState>();

  userLogin() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: mail!, password: password!);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
    }on FirebaseAuthException catch(e) {
      if (e.code == 'User-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          "No User found for that email ",
          style: TextStyle(fontSize: 18.0, color: Colors.black),),));
      }
      else if(e.code=='User-not-found'){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
          "Wrong Password Provided by user ",
          style: TextStyle(fontSize: 18.0, color: Colors.black),),));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
              Container(
                padding: EdgeInsets.only(top: 50,left: 30),
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB91635),
                      Color(0xff621d3c),
                      Color(0xFF311937),
                    ],),),
                child: Text("Hello\nSign in!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
                ,color: Colors.white),),
              ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 40,left: 30,right: 30.0,bottom: 30.0),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/4),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),
                topRight: Radius.circular(40))),
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Gmail",style: TextStyle(color:  Color(0xFFB91635),fontWeight: FontWeight.w500,fontSize: 23.0),),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Please Enter E-mail ';
                          }
                          return null;
                        },
                        controller: emialcontroller,
                        decoration: InputDecoration(hintText: "Gmail",prefixIcon: Icon(Icons.mail_outline)),
                      ),
                      SizedBox(height: 40.0,),
                      Text("Password",style: TextStyle(color:  Color(0xFFB91635),fontWeight: FontWeight.w500,fontSize: 23.0),),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Please Enter Password ';
                          }
                          return null;
                        },
                        controller: passwordcontroller,
                        decoration: InputDecoration(hintText: "Gmail",prefixIcon: Icon(Icons.password_outlined,),),
                          obscureText: true,
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Forgot-Password?",style: TextStyle(color:  Color(0xFF311937),fontWeight: FontWeight.w500,fontSize: 18.0),),
                        ],
                      ),
                      SizedBox(height: 60,),
                      GestureDetector(
                        onTap: (){
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              mail = emialcontroller.text;
                              password = passwordcontroller.text;
                            });
                            userLogin();
                          }
                        },
                        child: Container(
                        
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFB91635),
                                Color(0xff621d3c),
                                Color(0xFF311937),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Text("SIGN IN ",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold)
                              ,),),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Don't have account? ",style: TextStyle(color:Color(0xFF311937),fontSize: 17,fontWeight: FontWeight.bold)
                            ,),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                          // if(_formkey.currentState!.validate()){
                          //   setState(() {
                          //     mail = emialcontroller.text;
                          //     password = passwordcontroller.text;
                          //   });
                          //   userLogin();
                          // }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("SIGN UP ",style: TextStyle(color: Color(0xff621d3c),fontSize: 24,fontWeight: FontWeight.bold)
                              ,),
                          ],
                        ),
                      ),
                    ],
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
