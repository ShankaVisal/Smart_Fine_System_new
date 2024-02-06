import 'package:flutter/material.dart';
class issueFines extends StatefulWidget {
  @override
  State<issueFines> createState() => _issueFinesState();
}

class _issueFinesState extends State<issueFines> {
  late double screenWidth;
  late double screenHeight;
  int total = 0;
  bool? isChecked1 = false;
  bool? isChecked2 = false;
  bool? isChecked3 = false;
  bool? isChecked4 = false;
  bool? isChecked5 = false;
  bool? isChecked6 = false;
  bool? isChecked7 = false;
  bool? isChecked8 = false;
  bool? isChecked9 = false;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue Fines'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
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
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                _checkboxRow("Driving without registration – 10,000.00\nලියාපදිංචියකින් තොරව රිය පැදවීම - 10,000.00",
                    isChecked1, (value) {
                      setState(() {
                        isChecked1 = value;
                      });
                    }),
                _checkboxRow("Driving without a  valid license - LKR 200.00",
                    isChecked2, (value) {
                      setState(() {
                        isChecked2 = value;
                      });
                    }),
                _checkboxRow("Driving without a  valid license - LKR 300.00",
                    isChecked3, (value) {
                      setState(() {
                        isChecked3 = value;
                      });
                    }),

                ElevatedButton(
                  onPressed: () {
                    if (isChecked1 == true) total = total + 100;
                    if (isChecked2 == true) total = total + 200;
                    if (isChecked3 == true) total = total + 300;
                    setState(() {});
                  },
                  child: Text('Total fine $total'),
                ),
              ],
            ),
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
          child: Text(text),
        ),
        Checkbox(
          // tristate: true,
          value: isChecked,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
