import 'dart:math';
import 'package:barbarbookingapp/services/share_pref.dart';
import 'package:barbarbookingapp/pages/home.dart';
import 'package:barbarbookingapp/pages/login.dart';
import 'package:barbarbookingapp/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:random_string/random_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String ? name,mail,password;

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emialcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async{
    if(password!=null && name!=null && mail!=null){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: mail!, password: password !);

        // String id = randomAlphaNumeric((email:mail!,password:password!));
        // Map<String,dynamic> userInfoMap = {
        //   "Name":namecontroller.text,
        //   "Email":emialcontroller.text,
        //   "Id": id,
        //   "Image": "https://www.flaticon.com/free-icon/boy_4439947",
        // };

        // Function to generate random alphanumeric string of given length
        String randomAlphaNumeric(int length) {
          const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
          final random = Random();
          return String.fromCharCodes(Iterable.generate(
              length, (_) => chars.codeUnitAt(random.nextInt(chars.length))));
        }

// Assuming you want a random alphanumeric ID of length 8
        String id = randomAlphaNumeric(8);

        await SharepreferenceHelper().saveUserName(namecontroller.text);
        await SharepreferenceHelper().saveUserName(emialcontroller.text);
        await SharepreferenceHelper().saveUserImage("https://www.flaticon.com/free-icon/boy_4439947");
        await SharepreferenceHelper().saveUserId(id);
// Your original Map definition
        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emialcontroller.text,
          "Id": id,
          "Image": "https://www.flaticon.com/free-icon/boy_4439947",
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Registerd Successfully",style: TextStyle(fontSize: 20.0),)));
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
      }on FirebaseAuthException catch(e){
        if(e.code=='weak-paasword') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Password Provided is too weak ",
                style: TextStyle(fontSize: 20.0),
              )));
        }else if(e.code=='emial-already-i-use'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Account Already Exits",style: TextStyle(fontSize: 20.0),)));
        }
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
              child: Text("Create your \nAccount in!",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold
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
                      Text("Name",style: TextStyle(color:  Color(0xFFB91635),fontWeight: FontWeight.w500,fontSize: 23.0),),
                      TextFormField(
                        validator: (value){
                          if(value==null || value.isEmpty){
                            return 'Please Enter Name ';
                          }
                          return null;
                        },
                        controller: namecontroller,
                        decoration: InputDecoration(hintText: "Name",prefixIcon: Icon(Icons.person_outline)),
                      ),
                      SizedBox(height: 40.0,),
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

                      SizedBox(height: 30,),

                      GestureDetector(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              mail = emialcontroller.text;
                              name = namecontroller.text;
                              password = passwordcontroller.text;
                            });
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                            //Home();
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
                            child: Text("SIGN UP ",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold)
                              ,),),
                        ),
                      ),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Already have an account? ",style: TextStyle(color:Color(0xFF311937),fontSize: 17,fontWeight: FontWeight.bold)
                            ,),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("SIGN IN ",style: TextStyle(color: Color(0xff621d3c),fontSize: 24,fontWeight: FontWeight.bold)
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
