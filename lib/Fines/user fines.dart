import 'package:flutter/material.dart';
import 'package:untitled27/MyGlobals.dart';
import '../dbHelper/mongodb.dart';
import 'fines.dart';

class userFines extends StatefulWidget {
  final int total;
  userFines({required this.total});

  @override
  State<userFines> createState() => _userFinesState();
}

class _userFinesState extends State<userFines> {
  @override
  Widget build(BuildContext context) {
    int total1 = widget.total;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("total is ${widget.total}"),
          Text("total is ${fines[0].isChecked}"),
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
          ElevatedButton(
            onPressed: () async {
              await MongoDatabase.saveFinesToDatabase(total1); // Call the method from MongoDatabase class
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
