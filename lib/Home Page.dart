import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:untitled27/Scan%20QR.dart';
import 'package:untitled27/testingpage.dart';

import 'LicenseDataBase/displayEditForLicense.dart';

class homePage extends StatefulWidget {
  final String name;
  final String pageName;
  const homePage({required this.name, required this.pageName});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var getResult = 'QR Code Result';
  @override
  Widget build(BuildContext context) {

    String customizedText = '';

    if(widget.pageName == 'login'){
      customizedText = 'Welcome Back !';
    }else{
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
              padding: EdgeInsets.only(top:10, right: 10),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://shankavisal.github.io/SV-creations/assets/img/products/ssc.png",
                ),
                radius: 30,
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    customizedText,
                    style: const TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows:[
                        Shadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            offset: Offset(0.250, 0.250)
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                      'Hii  ${widget.name}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows:[
                        Shadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            offset: Offset(0.25, 0.25)
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(onPressed: (){
                    scanQRCode();
                  },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)
                      )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Scan QR Code"),
                        Icon(Icons.power_settings_new)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  testing()));
                  },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Enter Vehicle Number"),
                        Icon(Icons.settings_overscan)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  testing()));
                  },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Issue Fine"),
                        Icon(Icons.money)
                      ],
                    ),
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>  testing()));
                  },
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)
                        )
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Fine History"),
                        Icon(Icons.history)
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),
        ),
      ),
    );
  }

  void scanQRCode() async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);

      if(!mounted)return;

      setState(() {
        getResult = qrCode;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MongoDbDisplay(idNum: getResult)));
    } on PlatformException{
      getResult = 'Failed to scan QR Code';
    }
  }
}
