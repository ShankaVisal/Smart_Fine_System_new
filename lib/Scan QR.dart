import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:untitled27/LicenseDataBase/displayEditForLicense.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:math' show Random;

class scanQR extends StatefulWidget {
  const scanQR({super.key});

  @override
  State<scanQR> createState() => _scanQRState();
}

class _scanQRState extends State<scanQR> {

  TextEditingController textEditingController = TextEditingController();

  late final String my_key;
  late final encrypt.Encrypter encrypter;
  final iv = encrypt.IV.fromLength(16);

  var getResult = 'QR Code Result';

  @override
  void initState() {
    super.initState();
    my_key = generateRandomKey(32); // Generate a 256-bit (32 characters) key
    final keydata = encrypt.Key.fromUtf8(my_key);
    encrypter = encrypt.Encrypter(encrypt.AES(keydata));
  }

  String generateRandomKey(int length) {
    var random = Random.secure();
    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrserefretuvwxyz';
    return List.generate(length, (index) => chars[random.nextInt(chars.length)]).join();
  }


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
        textEditingController.text = qrCode;
        final decrypted = encrypter.decrypt64(qrCode, iv: iv);
        print("decrypted data is "+ decrypted);
        getResult = decrypted;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context)=> MongoDbDisplay(idNum: getResult)));
    } on PlatformException{
      getResult = 'Failed to scan QR Code';
    }
  }
}

