import 'package:barbarbookingapp/Admin/booking_admin.dart';
import 'package:barbarbookingapp/pages/booking.dart';
import 'package:barbarbookingapp/pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../pages/home.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  TextEditingController usernamecontroller = new TextEditingController();
  TextEditingController userpasswordcontroller = new TextEditingController();
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
              child: Text("Admin\nPanel!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
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

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 40.0,),
                      Text("Username",style: TextStyle(color:  Color(0xFFB91635),fontWeight: FontWeight.w500,fontSize: 23.0),),
                      TextFormField(

                        controller: usernamecontroller,
                        decoration: InputDecoration(hintText: "Username",prefixIcon: Icon(Icons.mail_outline)),
                      ),
                      SizedBox(height: 40.0,),
                      Text("Password",style: TextStyle(color:  Color(0xFFB91635),fontWeight: FontWeight.w500,fontSize: 23.0),),
                      TextFormField(

                        controller: userpasswordcontroller,
                        decoration: InputDecoration(hintText: "Password",prefixIcon: Icon(Icons.password_outlined,),),
                        obscureText: true,
                      ),

                      SizedBox(height: 30,),

                      GestureDetector(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          Login();
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
                            child: Text("LOG In",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold)
                              ,),),
                        ),
                      ),
                      Spacer(),
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
  loginAdmin(){
    FirebaseFirestore.instance.collection("Admin").get().then((snapshot) =>
        snapshot.docs.forEach((result) {
          if(result.data()['Id']!= usernamecontroller.text.trim()){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Your Id is not correct ",
                  style: TextStyle(fontSize: 20.0),
                )));
          }
          else if(result.data()['Password']!= userpasswordcontroller.text.trim()){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Your password is not correct ",
                  style: TextStyle(fontSize: 20.0),
                )));
          }
          else{
            Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingAdmin()));
          }
        }
        ));
  }
}
