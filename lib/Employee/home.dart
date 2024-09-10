import 'package:barbarbookingapp/Employee/employee.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeState extends StatefulWidget {
  const HomeState({super.key});

  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Employee()),
          );
        }, child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Flutter ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24.0,color: Colors.blue),),
          Text("Firebase",style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold,color: Colors.orange),),
        ],
      ),),
    );
  }
}
