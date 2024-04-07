import 'package:flutter/material.dart';
import 'package:untitled27/Fines/user%20fines.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import '../fines.dart';



class issueFines extends StatefulWidget {
  @override
  State<issueFines> createState() => _issueFinesState();
}

class _issueFinesState extends State<issueFines> {
  late double screenWidth;
  late double screenHeight;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

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
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              Container(
                width: screenWidth,
                height: screenHeight / 20,
                decoration: const BoxDecoration(
                  color: Color(0xff424750),
                ),
                child: const Center(
                  child: Text(
                    'Select the violation type',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: screenHeight / 1.7,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var fine in fines)
                        Column(
                          children: [
                            _checkboxRow(fine.name, fine.isChecked, (value) {
                              setState(() {
                                fine.isChecked = value!;
                                // userFinesLibrary().isChecked17 = value;
                                updateFineAmount(fine.isChecked!, fine.amount);
                              });
                            }),
                            const Divider(
                              height: 10,
                              color: Color(0xFF005EA3),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  'Total fine - Rs. $total .00',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              MainActionButton(
                  text: "Next",
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => userFines(total: total,)));
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkboxRow(
      String text, bool? isChecked, void Function(bool?) onChanged) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Checkbox(
          // tristate: true,
          value: isChecked,
          onChanged: onChanged,
          activeColor: const Color(0xFF005EA3),
          side: const BorderSide(
            color: Color(0xFF005EA3),
            width: 1.5,
          ),
        ),
      ],
    );
  }

  void updateFineAmount(bool isChecked, int amount) {
    if (isChecked == true) {
      total = total + amount;
      setState(() {

      });
    } else {
      total = total - amount;
      setState(() {

      });
    }
  }
}
