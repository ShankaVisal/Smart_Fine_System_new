import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled27/Theme/dark%20Theme.dart';
import 'package:untitled27/splash%20Screen.dart';
import 'dbHelper/mongodb.dart';
import 'Firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.connect();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Driving License Portal',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: const splashScreen(),
    );
  }
}
