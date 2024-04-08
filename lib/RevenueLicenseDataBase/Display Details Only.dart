import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled27/Fines/issueFines.dart';
import 'package:untitled27/Home%20Page.dart';
import 'package:untitled27/MyGlobals.dart';

import '../Firebase/Login page.dart';
import '../dbHelper/mongodb.dart';

class displayDetailsOnly extends StatefulWidget {
  final String vehicleNumber;

  displayDetailsOnly({required this.vehicleNumber});

  @override
  State<displayDetailsOnly> createState() => _displayDetailsOnlyState();
}

class _displayDetailsOnlyState extends State<displayDetailsOnly> {
  late Future<List<Map<String, dynamic>>> data;

  @override
  void initState() {
    super.initState();
    data = MongoDatabase.getDataFromRevenue(widget.vehicleNumber);
  }

  @override
  Widget build(BuildContext context) {
    String vehicleNum = '';
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const Text(
                "Vehicle Number",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.only(top: 10),
                height: 400.0,
                decoration: BoxDecoration(
                  color: const Color(0xFF7F8489),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: data,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.hasError) {

                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text('No data available.'),
                      );
                    } else {

                      globaldata().vehicleNumber = widget.vehicleNumber;
                      // Display the data in a ListView
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];

                          const textStyle = TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          );

                          return ListTile(
                              title: const Text(
                                'Vehicle Revenue Details',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              subtitle: Center(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Table(
                                      columnWidths: {
                                        0: FlexColumnWidth(2), // Adjust the column widths as needed
                                        1: FlexColumnWidth(2),
                                      },
                                      children: [
                                        _buildTableRow('Owner', "${item['name_of_owner'] ?? ''}"),
                                        _buildTableRow('Class of Vehicle', "${item['class_of_vehicle'] ?? ''}"),
                                        _buildTableRow('Fuel Type', "${item['fuel_type'] ?? ''}"),
                                        _buildTableRow('Vehicle Number', "${item['vehicle_number'] ?? ''}"),
                                        _buildTableRow('Unladen Gross Weight', "${item['unladen_gross_weight'] ?? ''}"),
                                        _buildTableRow('Number of Seats', "${item['number_of_seats'] ?? ''}"),
                                        _buildTableRow('Annual Fee, Arrears', "${item['annual_fee_arrears_fines_paid'] ?? ''}"),
                                        _buildTableRow('License Valid From', "${item['license_valid_from'] ?? ''}"),
                                        _buildTableRow('License Valid To', "${item['license_valid_to'] ?? ''}"),
                                      ],
                                    ),
                                  ),
                                ),
                              )

                            // Add more fields as needed
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                actionButton(
                  text: 'Menu',
                  btnColor: const Color(0xFF005EA3),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const homePage(
                              pageName: 'vehicle number',
                            )));
                  },
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class actionButton extends StatelessWidget {
  const actionButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.btnColor,
  });
  final String text;
  final Function onTap;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(btnColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide.none))),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}



TableRow _buildTableRow(String label, String value) {
  return TableRow(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the top
        children: [
          Expanded(
            flex: 3, // Adjust flex factor as needed
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(
                label,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            flex: 2, // Adjust flex factor as needed
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(value),
            ),
          ),
        ],
      ),
    ],
  );
}


