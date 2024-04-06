import 'package:flutter/material.dart';
import 'package:untitled27/MyGlobals.dart';
import 'MongoDbModelEditForLicense.dart';
import '../dbHelper/mongodb.dart';

class MongoDbDisplay extends StatefulWidget {
  final String idNum;
  MongoDbDisplay({required this.idNum});

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {
  late Future<List<MongoDbModel1>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = _getData();
  }

  Future<List<MongoDbModel1>> _getData() async {
    final data = await MongoDatabase.getData();
    return data
        .where((item) =>
    item['licenseNum'].toString().toLowerCase() ==
        widget.idNum.toLowerCase())
        .map((item) => MongoDbModel1.fromJson(item))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('License Details'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<MongoDbModel1>>(
            future: _dataFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                if (snapshot.hasData) {
                  if (snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("No Data Available for this QR Code"),
                    );
                  }
                  globaldata().driverFirstName = snapshot.data![0].firstName;
                  globaldata().driverLastName = snapshot.data![0].lastName;
                  globaldata().driverLicenseNumber = snapshot.data![0].licenseNum;
                  globaldata().DriverID = snapshot.data![0].IDnum;
                  print(globaldata().driverFirstName);
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return displayCard(snapshot.data![index]);
                    },
                  );
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
