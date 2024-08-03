import 'dart:developer';
import 'dart:js';

import 'package:barbarbookingapp/services/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/share_pref.dart';

class Booking extends StatefulWidget {
  final String service; // Declare service as a final variable

  Booking({required this.service}); // Constructor requires the service parameter
  @override
  State<Booking> createState() => _BookingState();
}
class _BookingState extends State<Booking> {
  String? name ,image,email;
  gettheMethodFromsharedpref() async{
    name = await SharepreferenceHelper().getUserName();
    image = await SharepreferenceHelper().getUserImage();
    email = await SharepreferenceHelper().getUserEmail();
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
   DateTime _selectedDate = DateTime.now();

   Future<void> _selectDate(BuildContext context) async {
     final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: _selectedDate,
       firstDate: DateTime(2024),
       lastDate: DateTime(2025),
     );
     if (picked != null && picked != _selectedDate) { // Corrected comparison here
       setState(() {
         _selectedDate = picked;
       });
     }
   }

   TimeOfDay _selectedTime = TimeOfDay.now();
   
   Future<void> _selectTime(BuildContext context) async{
     final TimeOfDay? picked = await showTimePicker(context: context, initialTime: _selectedTime);
         if(picked!=null && picked!= _selectedTime){
           setState(() {
             _selectedTime = picked;
           });
         }
   }
   
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b1615),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  // Add your onTap functionality here
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                    size: 30.0,
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Text("Let's then \n journey begin ",style: TextStyle(color: Colors.white70,fontSize: 28.0,fontWeight: FontWeight.w500),),
              SizedBox(height: 30.0,),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Image.asset("images/discount.png",fit: BoxFit.cover,height: 150,),),
              SizedBox(height: 30.0,),
              Text(widget.service,style: TextStyle(color: Colors.white,fontSize: 25.0,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30.0,),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                decoration: BoxDecoration(color: Color(0xFFb4817e),borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text("Set a Date ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0,color: Colors.black),),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectDate(context); // Call your _selectDate function here
                          },
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        SizedBox(height: 20.0,),
                        Text(
                          "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                padding: EdgeInsets.only(top: 10,bottom: 10.0),
                decoration: BoxDecoration(color: Color(0xFFb4817e),borderRadius: BorderRadius.circular(20)),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text("Set a Time ",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18.0,color: Colors.black),),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _selectTime(context); // Call your _selectDate function here
                          },
                          child: Icon(
                            Icons.alarm,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        SizedBox(height: 20.0,),
                        Text(
                          _selectedTime.format(context),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              GestureDetector(
                onTap: () async {
                  await gettheMethodFromsharedpref(); // Ensure name, image, and email are fetched

                  Map<String, dynamic> userBookingmap = {
                    "Service": widget.service,
                    "Date": "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                    "Time": _selectedTime.format(context),
                    "Name": name ?? '', // Use ?? '' to provide a default empty string if name is null
                    // "Image": image ?? '', // Use ?? '' to provide a default empty string if image is null
                    "Image": Image.asset("images/hari.png"),
                  };
                  String userId = ""; // Replace with actual userId if available
                  await DatabaseMethods().addUserDetails(userBookingmap,userId).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Service has been Booked Successfully",style: TextStyle(fontSize: 20.0),)));
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFfe8f33),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Book Now",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



