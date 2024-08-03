import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barbarbookingapp/services/database.dart';
import 'package:flutter/widgets.dart';
class BookingAdmin extends StatefulWidget {
  const BookingAdmin({super.key});

  @override
  State<BookingAdmin> createState() => _BookingAdminState();
}

class _BookingAdminState extends State<BookingAdmin> {
  Stream<QuerySnapshot>? bookingStream;
  getontheload() async {
    bookingStream = await DatabaseMethods().getBooking();
    setState(() {

    });
  }
  @override
  void initState(){
    getontheload();
    super.initState();
  }
  Widget allBookings() {
    return StreamBuilder<QuerySnapshot>(
      stream: bookingStream,
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        return snapshot.hasData
            ? ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (context, index) {
            DocumentSnapshot ds = snapshot.data!.docs[index];
            return Material(
              elevation: 8.0,
              borderRadius: BorderRadius.circular(60),
              child: Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFB91635),
                      Color(0xff621d3c),
                      Color(0xFF311937),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(60),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.network(
                            ds["Image"],
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Service : "+ds["Service"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Name : "+ds["Username"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Date : "+ds["Date"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Time : "+ds["Time"],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    GestureDetector(
                      onTap: () async{
                        await DatabaseMethods().DeleteBookings(ds.id);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0XFFdf711a),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Done",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            );
          },
        )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.0),
      child: Column(
        children: [
          Center(
            child: Text(
              "All Booking",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30),
          Expanded(child: allBookings()), // Added call to allBookings()
        ],
      ),
    );
  }
}
