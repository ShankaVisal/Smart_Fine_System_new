import 'package:flutter/material.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/RevenueLicenseDataBase/Display%20Detatils.dart';
import '../dbHelper/mongodb.dart';

class DisplayData extends StatefulWidget {
  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
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
              "Enter the Vehicle Number",
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
                  String upperCaseVehicleNumber =
                      vehicleNumberController.text.toUpperCase();
                  data = MongoDatabase.getDataFromRevenue(
                    upperCaseVehicleNumber,
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>displayDetails(vehicleNumber: vehicleNumberController.text.toUpperCase(),)));
                });
              },
            ),
            // Expanded(
            //   child: FutureBuilder<List<Map<String, dynamic>>>(
            //     future: data,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(
            //           child: CircularProgressIndicator(),
            //         );
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text('Error: ${snapshot.error}'),
            //         );
            //       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //         return const Center(
            //           child: Text('No data available.'),
            //         );
            //       } else {
            //         // Display the data in a ListView
            //         return ListView.builder(
            //           itemCount: snapshot.data!.length,
            //           itemBuilder: (context, index) {
            //             final item = snapshot.data![index];
            //             return ListTile(
            //                 title: const Text('Vehicle Revenue Details'),
            //                 subtitle: Center(
            //                   child: Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       const SizedBox(
            //                         height: 20,
            //                       ),
            //                       Text('Owner: ${item['name_of_owner'] ?? ''}'),
            //                       Text(
            //                           'Class of Vehicle: ${item['class_of_vehicle'] ?? ''}'),
            //                       Text('Fuel Type: ${item['fuel_type'] ?? ''}'),
            //                       Text(
            //                           'Vehicle Number: ${item['vehicle_number'] ?? ''}'),
            //                       Text(
            //                           'Unladen Gross Weight: ${item['unladen_gross_weight'] ?? ''}'),
            //                       Text(
            //                           'Number of Seats: ${item['number_of_seats'] ?? ''}'),
            //                       Text(
            //                           'Annual Fee, Arrears, Fines Paid: ${item['annual_fee__arrears__fines_paid'] ?? ''}'),
            //                       Text(
            //                           'License Valid From: ${item['license_valid_from'] ?? ''}'),
            //                       Text(
            //                           'License Valid To: ${item['license_valid_to'] ?? ''}'),
            //                       // Add more fields as needed
            //                     ],
            //                   ),
            //                 )
            //
            //                 // Add more fields as needed
            //                 );
            //           },
            //         );
            //       }
            //     },
            //   ),
            // ),
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
