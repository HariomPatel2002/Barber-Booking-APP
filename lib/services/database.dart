import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class DatabaseMethods{
  Future addUserDetails(Map<String,dynamic>userInfoMap,String id) async{
    return await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(userInfoMap);
  }
  Future addUserBooking(Map<String,dynamic>userInfoMap) async{
    return await FirebaseFirestore.instance
        .collection("Booking")
        .add(userInfoMap);
  }
  Future<Stream<QuerySnapshot>> getBooking() async {
    return FirebaseFirestore.instance.collection("Booking").snapshots();
  }
   Future DeleteBookings(String id) async{
    return await FirebaseFirestore.instance
        .collection("Booking")
        .doc(id)
        .delete();
  }
}
