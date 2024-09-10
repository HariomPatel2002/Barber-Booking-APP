import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home.dart'; // Ensure you have the correct import for your HomeState

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBAVvWCTUctvZJ44sfU0ZC2P2JKY9U5jTk",
      appId: "1:1027714587688:android:a36ff47cb7006f3714691d",
      messagingSenderId: "1027714587688",
      projectId: "baarbarapp-d7687",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeState(), // Ensure HomeState is the starting widget
    );
  }
}
