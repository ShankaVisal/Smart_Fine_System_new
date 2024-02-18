import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled27/Home%20Page.dart';

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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late double ScreenWidth;
  late double ScreenHeight;

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery.of(context).size.width;
    ScreenHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Smart Driving License Portal',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      home: FutureBuilder(
          future: FirebaseAuth.instance.authStateChanges().first, 
          builder: (context, AsyncSnapshot<User?> snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.hasData){
                return homePage(name: "name", pageName: "pasge name");
              } else{
                return splashScreen();
              }
            } else {
              return splashScreen();
            }
          }
      ),
    );
  }
}
