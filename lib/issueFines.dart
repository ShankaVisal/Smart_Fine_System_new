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
  bool? isChecked10 = false;
  bool? isChecked11= false;
  bool? isChecked12= false;
  bool? isChecked13= false;
  bool? isChecked14= false;
  bool? isChecked15= false;
  bool? isChecked16= false;
  bool? isChecked17= false;
  bool? isChecked18= false;
  bool? isChecked19= false;
  bool? isChecked20= false;
  bool? isChecked21= false;

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
                        if (isChecked1==true) {
                          total += 10000;
                        } else {
                          total -= 10000;
                        }
                      });
                    }),
                _checkboxRow("Driving without insurance – 20,000.00\nරක්ෂණයකින් තොරව රිය පැදවීම - 20,000.00",
                    isChecked2, (value) {
                      setState(() {
                        isChecked2 = value;
                        if (isChecked2==true) {
                          total += 20000;
                        } else {
                          total -= 20000;
                        }
                      });
                    }),
                _checkboxRow("Driving with wrong number plates – 10,000.00\nවැරදි අංක තහඩු සහිතව රිය පැදවීම - 10,000.00",
                    isChecked3, (value) {
                      setState(() {
                        isChecked3 = value;
                        if (isChecked3==true) {
                          total += 10000;
                        } else {
                          total -= 10000;
                        }
                      });
                    }),
                _checkboxRow("Using the car regardless of the terms of the license –30,000.00 + 15 days imprisonment\nබලපත්‍රයේ නියමයන් නොසලකා මෝටර් රථය භාවිතා කිරීම -30,000.00 + දින 15 සිර දඬුවම",
                    isChecked4, (value) {
                      setState(() {
                        isChecked4 = value;
                        if (isChecked4==true) {
                          total += 30000;
                        } else {
                          total -= 30000;
                        }
                      });
                    }),
                _checkboxRow("Driving without a driver’s license or license without plates – 5000.00\nරියදුරු බලපත්‍රයක් හෝ තහඩු නොමැතිව බලපත්‍රයක් නොමැතිව රිය පැදවීම - 5000.00",
                    isChecked5, (value) {
                      setState(() {
                        isChecked5 = value;
                        if (isChecked5==true) {
                          total += 5000;
                        } else {
                          total -= 5000;
                        }
                      });
                    }),
                _checkboxRow("Driving without a license or driver’s license – 2000.00\nබලපත්රයක් හෝ රියදුරු බලපත්රයක් නොමැතිව රිය පැදවීම - 2000.00",
                    isChecked6, (value) {
                      setState(() {
                        isChecked6 = value;
                        if (isChecked6==true) {
                          total += 2000;
                        } else {
                          total -= 2000;
                        }
                      });
                    }),
                _checkboxRow("Not having license or driver’s license when stopped – 10,000.00\nනතර කළ විට බලපත්‍රය හෝ රියදුරු බලපත්‍රය නොමැති වීම - 10,000.00",
                    isChecked7, (value) {
                      setState(() {
                        isChecked7 = value;
                        if (isChecked2==true) {
                          total += 10000;
                        } else {
                          total -= 10000;
                        }
                      });
                    }),
                _checkboxRow("Reckless driving without accident – 11,000.00\nඅනතුරකින් තොරව නොසැලකිලිමත් ලෙස රිය පැදවීම - 11,000.00",
                    isChecked8, (value) {
                      setState(() {
                        isChecked8 = value;
                        if (isChecked8==true) {
                          total += 11000;
                        } else {
                          total -= 11000;
                        }
                      });
                    }),
                _checkboxRow("Car collision by careless driving- 25,000.00\nනොසැලකිලිමත් ලෙස රිය පැදවීමෙන් මෝටර් රථ ගැටීම - 25,000.00",
                    isChecked9, (value) {
                      setState(() {
                        isChecked9 = value;
                        if (isChecked9==true) {
                          total += 25000;
                        } else {
                          total -= 25000;
                        }
                      });
                    }),
                _checkboxRow("Driving without seat belt – 2000.00\nආසන පටි නොමැතිව රිය පැදවීම - 2000.00",
                    isChecked10, (value) {
                      setState(() {
                        isChecked10 = value;
                        if (isChecked10==true) {
                          total += 2000;
                        } else {
                          total -= 2000;
                        }
                      });
                    }),
                _checkboxRow("Traveling with passengers without wearing seat belts – 2000.00\nආසන පටි පැළඳ නොගෙන මගීන් සමඟ ගමන් කිරීම - 2000.00",
                    isChecked11, (value) {
                      setState(() {
                        isChecked11 = value;
                        if (isChecked11==true) {
                          total += 2000;
                        } else {
                          total -= 2000;
                        }
                      });
                    }),
                _checkboxRow("Failure to obey traffic signs – 10,000.00\nමාර්ග සංඥා පිළිපැදීමට අපොහොසත් වීම - 10,000.00",
                    isChecked12, (value) {
                      setState(() {
                        isChecked12 = value;
                        if (isChecked12==true) {
                          total += 10000;
                        } else {
                          total -= 10000;
                        }
                      });
                    }),
                _checkboxRow("Failure to drive to the left when overtaking a vehicle – 5,000.00\nවාහනයක් අභිබවා යාමේදී වමට ධාවනය නොකිරීම - 5,000.00",
                    isChecked13, (value) {
                      setState(() {
                        isChecked13 = value;
                        if (isChecked3==true) {
                          total += 5000;
                        } else {
                          total -= 5000;
                        }
                      });
                    }),
                _checkboxRow("Overtaking on the left – 5,000.00\nවම් පසින් අභිබවා යාම - 5,000.00",
                    isChecked14, (value) {
                      setState(() {
                        isChecked14 = value;
                        if (isChecked14==true) {
                          total += 5000;
                        } else {
                          total -= 5000;
                        }
                      });
                    }),
                _checkboxRow("Not allowing other overtaking vehicles to pass – 5,000.00\nවෙනත් අභිබවා යන වාහන පසුකර යාමට ඉඩ නොදීම - 5,000.00",
                    isChecked15, (value) {
                      setState(() {
                        isChecked15 = value;
                        if (isChecked15==true) {
                          total += 5000;
                        } else {
                          total -= 5000;
                        }
                      });
                    }),
                _checkboxRow("Driving from the station obstructing the road- 4,000.00\nමාර්ගයට බාධා වන පරිදි දුම්රිය ස්ථානයෙන් රිය පැදවීම - 4,000.00",
                    isChecked16, (value) {
                      setState(() {
                        isChecked16 = value;
                        if (isChecked16==true) {
                          total += 4000;
                        } else {
                          total -= 4000;
                        }
                      });
                    }),
                _checkboxRow("Overtaking where the road is not visible – 9,000.00\nමාර්ගය නොපෙනෙන තැන අභිබවා යාම - 9,000.00",
                    isChecked17, (value) {
                      setState(() {
                        isChecked17 = value;
                        if (isChecked17==true) {
                          total += 9000;
                        } else {
                          total -= 9000;
                        }
                      });
                    }),
                _checkboxRow("Driving back more than two vehicle lengths to turn – 3,000.00\nහැරවීමට වාහන දිග දෙකකට වඩා පසුපසට ධාවනය කිරීම - 3,000.00",
                    isChecked18, (value) {
                      setState(() {
                        isChecked18 = value;
                        if (isChecked18==true) {
                          total += 3000;
                        } else {
                          total -= 3000;
                        }
                      });
                    }),
                _checkboxRow("Obstructing the free passage of the vehicle – 5,000.00\nවාහනයේ නිදහස් ගමනට බාධා කිරීම - 5,000.00",
                    isChecked19, (value) {
                      setState(() {
                        isChecked19 = value;
                        if (isChecked19==true) {
                          total += 5000;
                        } else {
                          total -= 5000;
                        }
                      });
                    }),
                _checkboxRow("Using mobile phone or other electronic device while driving – 10,000.00\nරිය පැදවීමේදී ජංගම දුරකථනය හෝ වෙනත් ඉලෙක්ට්‍රොනික උපකරණයක් භාවිතා කිරීම - 10,000.00",
                    isChecked20, (value) {
                      setState(() {
                        isChecked20 = value;
                        if (isChecked20==true) {
                          total += 10000;
                        } else {
                          total -= 10000;
                        }
                      });
                    }),
                _checkboxRow("Keeping an electronic device between the driver – 10,000.00ර\nියදුරු අතර ඉලෙක්ට්රොනික උපාංගයක් තබා ගැනීම - 10,000.00",
                    isChecked21, (value) {
                      setState(() {
                        isChecked21 = value;
                        if (isChecked21==true) {
                          total += 10000;
                        } else {
                          total -= 10000;
                        }
                      });
                    }),

                ElevatedButton(
                  onPressed: () {

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
