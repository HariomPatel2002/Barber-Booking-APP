import 'package:barbarbookingapp/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body: Container(
        margin: EdgeInsets.only(top: 120.0),
        child: Column(
          children: [
            Image.asset("images/Hari.png"),
            SizedBox(height: 80.0,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                decoration:  BoxDecoration(
                  color: Color(0xFFdf711a),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Text("Get a stylish Haircut",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 22.0,
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
