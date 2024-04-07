import 'package:flutter/material.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/MyGlobals.dart';
import '../Fines/issueFines.dart';
import '../Home Page.dart';
import '../RevenueLicenseDataBase/RevenueLicenseData.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // const SizedBox(height: 10),
              const Text(
                "Driving License Details",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<MongoDbModel1>>(
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
                          child: Text(""),
                        );
                      }
                      globaldata().isQR = true;
                      globaldata().url = snapshot.data![0].url;
                      // globaldata().driverFirstName = snapshot.data![0].firstName;
                      // globaldata().driverLastName = snapshot.data![0].lastName;
                      print(globaldata().driverFirstName);
                      return CircleAvatar(
                        backgroundImage: NetworkImage(
                          globaldata().url,
                        ),
                        radius: 80,
                      );
                    } else {
                      return const Center(
                        child: Text("No Data Available"),
                      );
                    }
                  }
                },
              ),
              // CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     globaldata().url,
              //   ),
              //   radius: 80,
              // ),

              Expanded(
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
                        globaldata().url = snapshot.data![0].url;
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
              globaldata().isQR==true ? MainActionButton(text: "Check Vehicle", onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DisplayData()));
              }):
              MainActionButton(text: "Menu", onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => homePage(pageName: "QR page")));
              }),
            ],
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
