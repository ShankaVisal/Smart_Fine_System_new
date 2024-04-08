import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/HelpDesk.dart';
import 'package:untitled27/PoliceOfficer%20account/Police%20officer%20details.dart';
import 'package:untitled27/PoliceOfficer%20account/display%20police%20officer%20details.dart';
import 'package:untitled27/RevenueLicenseDataBase/RevenueLicenseData%20Only.dart';
import 'package:untitled27/splash%20Screen.dart';

import 'package:untitled27/testingpage.dart';

import 'LicenseDataBase/displayEditForLicense.dart';
import 'RevenueLicenseDataBase/RevenueLicenseData.dart';
import 'fines/issueFines.dart';

final ButtonStyle mainCardStyle = ElevatedButton.styleFrom(
  elevation: 20,
  backgroundColor: const Color.fromARGB(51, 217, 217, 217),
  padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30.0),
  ),
);

class homePage extends StatefulWidget {
  final String pageName;
  const homePage({ required this.pageName});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var getResult = 'QR Code Result';
  @override
  Widget build(BuildContext context) {
    String customizedText = '';

    if (widget.pageName == 'login') {
      customizedText = 'Welcome Back !';
    } else {
      customizedText = 'Welcome to MyDrive Portal';
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(top: 30, right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://img.freepik.com/premium-vector/cop-icon-flat-style-design-police-officer-avatar-vector-illustration-isolated-white-background-symbol-security-law-order-policeman-sheriff_153097-648.jpg",
                ),
                radius: 30,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customizedText,
                  style: const TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          blurRadius: 2.0,
                          offset: Offset(0.250, 0.250))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                // Text(
                //   'Hii  ${widget.name}',
                //   style: const TextStyle(
                //     fontSize: 20.0,
                //     fontWeight: FontWeight.bold,
                //     color: Color.fromARGB(255, 126, 127, 128),
                //   ),
                // ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    scanQRCode();
                  },
                  style: mainCardStyle,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Scan QR Code",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.qr_code_2,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DisplayDataOnly()));
                  },
                  style: mainCardStyle,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Enter Vehicle Number",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.confirmation_num,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),


                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserDetailsList()));
                  },
                  style: mainCardStyle,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fine History",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.history,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HelpDesk()));
                  },
                  style: mainCardStyle,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Support",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.support_agent,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    signOut();
                    exitApp(context);
                  },
                  style: mainCardStyle,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blue,
                        child: Icon(
                          Icons.logout,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        getResult = qrCode;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MongoDbDisplay(idNum: getResult)));
    } on PlatformException {
      getResult = 'Failed to scan QR Code. Please try again.';
    }
  }
}

Future<void> signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print("Error signing out: $e");
  }
}

void exitApp(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=>splashScreen()));
}

