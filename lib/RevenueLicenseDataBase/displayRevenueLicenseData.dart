import 'package:flutter/material.dart';
import '../dbHelper/mongodb.dart';

class DisplayData extends StatefulWidget {
  @override
  _DisplayDataState createState() => _DisplayDataState();
}

class _DisplayDataState extends State<DisplayData> {
  late Future<List<Map<String, dynamic>>> data;
  late TextEditingController _vehicleNumberController;

  @override
  void initState() {
    super.initState();
    _vehicleNumberController = TextEditingController();
    data = MongoDatabase.getDataFromRevenue('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Data'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _vehicleNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Vehicle Number',
                hintText: 'XXX-XXXX',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      String upperCaseVehicleNumber = _vehicleNumberController.text.toUpperCase();
                      data = MongoDatabase.getDataFromRevenue(
                        upperCaseVehicleNumber,
                      );
                    });
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
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
                  // Display the data in a ListView
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];
                      return ListTile(
                          title: Text('Vehicle Revenue Details'),
                          subtitle: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20,),
                                Text('Owner: ${item['name_of_owner'] ?? ''}'),
                                Text('Class of Vehicle: ${item['class_of_vehicle'] ?? ''}'),
                                Text('Fuel Type: ${item['fuel_type'] ?? ''}'),
                                Text('Vehicle Number: ${item['vehicle_number'] ?? ''}'),
                                Text('Unladen Gross Weight: ${item['unladen_gross_weight'] ?? ''}'),
                                Text('Number of Seats: ${item['number_of_seats'] ?? ''}'),
                                Text('Annual Fee, Arrears, Fines Paid: ${item['annual_fee__arrears__fines_paid'] ?? ''}'),
                                Text('License Valid From: ${item['license_valid_from'] ?? ''}'),
                                Text('License Valid To: ${item['license_valid_to'] ?? ''}'),
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
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _vehicleNumberController.dispose();
    super.dispose();
  }
}
