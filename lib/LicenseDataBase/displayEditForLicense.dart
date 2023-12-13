import 'package:flutter/material.dart';
import 'MongoDbModelEditForLicense.dart';
import '../dbHelper/mongodb.dart';

class MongoDbDisplay extends StatefulWidget {
  final String idNum;
  MongoDbDisplay({required this.idNum});

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('License Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: MongoDatabase.getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  var filteredData = snapshot.data
                      .where((item) =>
                  item['licenseNum'].toString().toLowerCase() ==
                      widget.idNum.toLowerCase())
                      .toList();
                  var totalData = filteredData.length;
                  print('Total Data' + totalData.toString());
                  if (totalData > 0) {
                    return ListView.builder(
                      itemCount: totalData,
                      itemBuilder: (context, index) {
                        return displayCard(
                            MongoDbModel1.fromJson(filteredData[index]));
                      },
                    );
                  } else {
                    return Center(
                      child: Text("No Data Available for this QR Code"),
                    );
                  }
                } else {
                  return const Center(
                    child: Text("No Data Available"),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}

Widget displayCard(MongoDbModel1 data) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Table(
        columnWidths: {
          0: FlexColumnWidth(2), // Adjust the column widths as needed
          1: FlexColumnWidth(2),
        },
        children: [
          _buildTableRow('First Name', data.firstName),
          _buildTableRow('Last Name', data.lastName),
          _buildTableRow('Date of Birth', data.DOB),
          _buildTableRow('Date of issue of the LICENSE', data.DOI),
          _buildTableRow('Date of expiry of the LICENSE', data.DOE),
          _buildTableRow('ID Number', data.IDnum),
          _buildTableRow('Number of License', data.licenseNum),
          _buildTableRow('Permanent place of residence', data.address),
          _buildTableRow('Categories of vehicles', data.vehicleCategory),
        ],
      ),
    ),
  );
}

TableRow _buildTableRow(String label, String value) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Text(value),
      ),
    ],
  );
}

