import 'package:flutter/material.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/MyGlobals.dart';
import 'package:untitled27/RevenueLicenseDataBase/Display%20Details%20Only.dart';
import 'package:untitled27/RevenueLicenseDataBase/Display%20Detatils.dart';
import '../dbHelper/mongodb.dart';
import '../fines.dart';

class DisplayDataOnly extends StatefulWidget {
  @override
  _DisplayDataOnlyState createState() => _DisplayDataOnlyState();
}

class _DisplayDataOnlyState extends State<DisplayDataOnly> {
  late Future<List<Map<String, dynamic>>> data;
  late TextEditingController vehicleNumberController;

  @override
  void initState() {
    super.initState();
    vehicleNumberController = TextEditingController();
    data = MongoDatabase.getDataFromRevenue('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF005EA3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 44, 44, 44).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                // changes position of shadow
              ),
            ],
          ),
          child: GestureDetector(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Enter Vehicle Number",
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Text(
              'Enter vehicle number to check licenses Details.',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 126, 127, 128)),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: vehicleNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Vehicle Number',
                hintText: 'XXX-XXXX',
                filled: true,
                fillColor: const Color.fromARGB(255, 114, 114, 114),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 20),
            MainActionButton(
              text: "Next",
              onTap: () {
                setState(() {
                  for (var fine in fines)
                    fine.isChecked = false;
                  globaldata().isQR = false;
                  String upperCaseVehicleNumber =
                      vehicleNumberController.text.toUpperCase();
                  data = MongoDatabase.getDataFromRevenue(
                    upperCaseVehicleNumber,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>displayDetailsOnly(vehicleNumber: vehicleNumberController.text.toUpperCase(),)));
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    vehicleNumberController.dispose();
    super.dispose();
  }
}


