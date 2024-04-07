import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/MyGlobals.dart';
import 'package:untitled27/RevenueLicenseDataBase/Display%20Detatils.dart';


import '../dbHelper/mongodb.dart';
import '../fines.dart';

class userFines extends StatefulWidget {
  final int total;
  userFines({required this.total});

  @override
  State<userFines> createState() => _userFinesState();
}

class _userFinesState extends State<userFines> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    int total1 = widget.total;
    return SafeArea(
      child: Scaffold(
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
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 20),
              const Text(
                "Fine Details",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF7F8489),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: height/3*2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Column(

                            children: [
                              Text("Total is", style: TextStyle(fontSize: 40),),
                              Text("Rs: ${widget.total}.00",style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),

                        Text("Driver Name -  ${globaldata().driverFirstName} " +
                            "${globaldata().driverLastName}"),
                        Text("License Number - ${globaldata().driverLicenseNumber}"),
                        Text("Identity Card Number - ${globaldata().DriverID}"),
                        Text("Vehicle Number - ${globaldata().vehicleNumber}"),
                        Column(
                          children: [
                            for (var fine in fines)
                              Column(
                                children: [
                                  if (fine.isChecked)
                                    Row(
                                      children: [
                                        Text(fine.name),
                                        Text("${fine.amount}"),
                                      ],
                                    ),
                                ],
                              )
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // MainActionButton(text: 'Issue', onTap: )
              actionButton(text: "Issue", onTap: () async{
                await MongoDatabase.saveFinesToDatabase(total1);
              }, btnColor: Colors.red)
            ],
          ),
        ),
      ),
    );
  }
}
