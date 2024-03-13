import 'package:flutter/material.dart';
import 'package:untitled27/MyGlobals.dart';

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
          Column(
            children: [
              for (var fine in fines)
                Column(
                  children: [
                    if (fine.isChecked) Row(
                      children: [
                        Text(fine.name),
                        Text("${fine.amount}"),
                      ],
                    ),

                  ],
                )
            ],
          )
        ],
      ),
    );
  }
}
