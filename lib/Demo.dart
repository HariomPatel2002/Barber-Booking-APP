import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:convert'; // For decoding base64 image
import 'dart:typed_data'; // For Uint8List

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Ensure Firebase is initialized
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Firestore Example')),
        body: AdminData(),
      ),
    );
  }
}

class AdminData extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _firestore.collection('Admin').doc('u6NU8zswDdWy1vMrsN65').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (!snapshot.hasData) {
          return Center(child: Text('No data found'));
        }

        var data = snapshot.data!.data() as Map<String, dynamic>;

        // Decode the base64 image
        String base64Image = data['Image'];
        Uint8List bytes = base64Decode(base64Image.split(',')[1]);

        return ListView(
          children: [
            ListTile(
              title: Text('Date'),
              subtitle: Text(data['Date'] ?? 'No date provided'),
            ),
            ListTile(
              title: Text('Email'),
              subtitle: Text(data['Email'] ?? 'No email provided'),
            ),
            ListTile(
              title: Text('Service'),
              subtitle: Text(data['Service'] ?? 'No service provided'),
            ),
            ListTile(
              title: Text('Time'),
              subtitle: Text(data['Time'] ?? 'No time provided'),
            ),
            ListTile(
              title: Text('Password'),
              subtitle: Text(data['password'] ?? 'No password provided'),
            ),
            ListTile(
              title: Text('Username'),
              subtitle: Text(data['Username'] ?? 'No username provided'),
            ),
            // Display the image
            ListTile(
              title: Text('Image'),
              subtitle: data['Image'] != null
                  ? Image.memory(bytes)
                  : Text('No image provided'),
            ),
          ],
        );
      },
    );
  }
}
