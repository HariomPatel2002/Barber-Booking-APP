import 'package:barbarbookingapp/pages/booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/share_pref.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String? name ,image;
  gettheMethodFromsharedpref() async{
    name = await SharepreferenceHelper().getUserName();
    image = await SharepreferenceHelper().getUserImage();
    setState(() {

    });
  }

  getontheload()async{
    await gettheMethodFromsharedpref();
    setState(() {

    });
  }
   @override
   void initState(){
     getontheload();
    super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
        body: Container(
          margin: EdgeInsets.only(top: 50.0,left: 20.0,right: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Hello",style: TextStyle(color: Color.fromARGB(197, 255, 255, 255),fontSize: 24,fontWeight: FontWeight.w500),),
                        Text("Hariom Patel",style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.network("assets/images/Hari.png",height: 60,width: 60,fit: BoxFit.cover,)),
                  ],),
                SizedBox(height: 20.0),
                Divider(color: Colors.white30,),
                SizedBox(height: 30.0),
                Text(
                  "Services ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: "Classic Shaving ",),));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/shaving.png",height: 80,width: 80,fit: BoxFit.cover),SizedBox(height: 10),
                              Text(
                                "Classic Shaving ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,width: 20,),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: "Hari Washing",),));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/hair.png",height: 80,width: 80,fit: BoxFit.cover,),SizedBox(height: 10),
                              Text(
                                "Hair Washing",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: "Hari Cutting ",),));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/cutting.png",height: 80,width: 80,fit: BoxFit.cover),SizedBox(height: 10),
                              Text(
                                "Hari Cutting ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,width: 20,),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: "Beard Tremming",),));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/beard.png",height: 80,width: 80,fit: BoxFit.cover,),SizedBox(height: 10),
                              Text(
                                "Beard Tremming",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: "Facials",),));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/facials.png",height: 80,width: 80,fit: BoxFit.cover),SizedBox(height: 10),
                              Text(
                                "Facials ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0,width: 20,),
                    Flexible(
                      fit: FlexFit.tight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking(service: "Kids Haircutting",),));
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFe29452),borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset("images/cutting.png",height: 80,width: 80,fit: BoxFit.cover,),SizedBox(height: 10),
                              Text(
                                "Kids Haircutting",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}
