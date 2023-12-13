import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:untitled27/LicenseDataBase/displayEditForLicense.dart';

class scanQR extends StatefulWidget {
  const scanQR({super.key});

  @override
  State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {


  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  scanQRCode();
                },
                child: Text('Scan QR')
            ),
          ],
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

