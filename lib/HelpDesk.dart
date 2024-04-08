import 'package:flutter/material.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/RevenueLicenseDataBase/Display%20Details%20Only.dart';

class HelpDesk extends StatelessWidget {
  HelpDesk({Key? key}) : super(key: key);

  final List<String> steps = [
    "Scan QR Code",
    "Tap Check Vehicle",
    "Enter Vehicle Number",
    "Tap Next",
    "Select Issue Fine or Menu",
    "Select Violation types on checkboxes if there is any!",
    "Select Next",
    "Check Confirmation",
    "Issue Fine!"
  ];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
              "Help Desk",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: steps.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: const Color.fromARGB(51, 217, 217, 217),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: Text((index + 1).toString()),
                        ),
                        title: Text(
                          steps[index],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          // Handle tap if needed
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0,),
            actionButton(text: "Emergency Call", onTap: (){}, btnColor: Colors.red)
          ],
        ),
      ),
    );
  }
}
