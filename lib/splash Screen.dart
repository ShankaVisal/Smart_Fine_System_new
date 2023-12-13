import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled27/Firebase/Login%20page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 4)).then((value){
      Navigator.push(context , MaterialPageRoute(builder: (context)=> const loginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF222222),
      body: Stack(
        fit: StackFit.expand,
        children: [

          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff353A40),
                    Color(0xff16171B),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
            ),
          ),

          const Center(
            child: Text(
              'Smart Driving License App',
              style: TextStyle(fontSize: 24.0),
            ),
          ),

          // Positioned Lottie Animation at the Bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Adjust the height as needed
              color: Colors.transparent, // Adjust as needed
              child: Lottie.asset('assets/a1.json'),
            ),
          ),

        ],
      ),
    );
  }
}