import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled27/Fines/issueFines.dart';
import 'package:untitled27/Home%20Page.dart';
import 'package:untitled27/MyGlobals.dart';

import '../Firebase/Login page.dart';
import '../dbHelper/mongodb.dart';

class displayDetails extends StatefulWidget {
  final String vehicleNumber;

  displayDetails({required this.vehicleNumber});

  @override
  State<displayDetails> createState() => _displayDetailsState();
}

class _displayDetailsState extends State<displayDetails> {
  late Future<List<Map<String, dynamic>>> data;

  @override
  void initState() {
    super.initState();
    data = MongoDatabase.getDataFromRevenue(widget.vehicleNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}



