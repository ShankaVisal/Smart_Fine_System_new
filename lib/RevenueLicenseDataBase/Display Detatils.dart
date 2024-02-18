import 'package:flutter/material.dart';

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
    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
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
            // Display the data in a ListView
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final item = snapshot.data![index];
                return ListTile(
                    title: const Text('Vehicle Revenue Details'),
                    subtitle: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text('Owner: ${item['name_of_owner'] ?? ''}'),
                          Text(
                              'Class of Vehicle: ${item['class_of_vehicle'] ?? ''}'),
                          Text('Fuel Type: ${item['fuel_type'] ?? ''}'),
                          Text(
                              'Vehicle Number: ${item['vehicle_number'] ?? ''}'),
                          Text(
                              'Unladen Gross Weight: ${item['unladen_gross_weight'] ?? ''}'),
                          Text(
                              'Number of Seats: ${item['number_of_seats'] ?? ''}'),
                          Text(
                              'Annual Fee, Arrears, Fines Paid: ${item['annual_fee__arrears__fines_paid'] ?? ''}'),
                          Text(
                              'License Valid From: ${item['license_valid_from'] ?? ''}'),
                          Text(
                              'License Valid To: ${item['license_valid_to'] ?? ''}'),
                          // Add more fields as needed
                        ],
                      ),
                    )

                  // Add more fields as needed
                );
              },
            );
          }
        },
      ),
      // body: ListTile(
      //     title: const Text('Vehicle Revenue Details'),
      //     subtitle: Center(
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           const SizedBox(
      //             height: 20,
      //           ),
      //           Text('Owner: '+ widget.owner),
      //           Text(
      //               'Class of Vehicle: '+ widget.classOfVehicle),
      //           Text('Fuel Type: '+ widget.fuelType),
      //           Text(
      //               'Vehicle Number: '+widget.classOfVehicle),
      //           Text(
      //               'Unladen Gross Weight: '+ widget.UnladenGross),
      //           Text(
      //               'Number of Seats: '+widget.NumberOfSeats),
      //           Text(
      //               'Annual Fee, Arrears, Fines Paid: '+widget.AnnualFee),
      //           Text(
      //               'License Valid From: '+widget.LicenseValidFrom),
      //           Text(
      //               'License Valid To: '+widget.LicenseValidTo),
      //           // Add more fields as needed
      //         ],
      //       ),
      //     )
      //
      //   // Add more fields as needed
      // ),
    );;
  }
}
