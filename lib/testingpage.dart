// import 'package:flutter/material.dart';
// import 'package:untitled27/Firebase/Login%20page.dart';
// import 'package:untitled27/MyGlobals.dart';
// import 'package:untitled27/user%20fines.dart';
//
//
// class issueFines extends StatefulWidget {
//   @override
//   State<issueFines> createState() => _issueFinesState();
// }
//
// class _issueFinesState extends State<issueFines> {
//   late double screenWidth;
//   late double screenHeight;
//   int total = 0;
//
//   bool? isChecked1 = false;
//   String fine1 = "Driving without registration – 10,000.00\nලියාපදිංචියකින් තොරව රිය පැදවීම - 10,000.00";
//
//   bool? isChecked2 = false;
//   String fine2 = "Driving without insurance – 20,000.00\nරක්ෂණයකින් තොරව රිය පැදවීම - 20,000.00";
//
//   bool? isChecked3 = false;
//   String fine3 = "Driving with wrong number plates – 10,000.00\nවැරදි අංක තහඩු සහිතව රිය පැදවීම - 10,000.00";
//
//   bool? isChecked4 = false;
//   String fine4 = "Using the car regardless of the terms of the license –30,000.00 + 15 days imprisonment\nබලපත්‍රයේ නියමයන් නොසලකා මෝටර් රථය භාවිතා කිරීම -30,000.00 + දින 15 සිර දඬුවම";
//
//   bool? isChecked5 = false;
//   String fine5 = "Driving without a driver’s license or license without plates – 5000.00\nරියදුරු බලපත්‍රයක් හෝ තහඩු නොමැතිව බලපත්‍රයක් නොමැතිව රිය පැදවීම - 5000.00";
//
//   bool? isChecked6 = false;
//   String fine6 = "Driving without a license or driver’s license – 2000.00\nබලපත්රයක් හෝ රියදුරු බලපත්රයක් නොමැතිව රිය පැදවීම - 2000.00";
//
//   bool? isChecked7 = false;
//   String fine7 = "Not having license or driver’s license when stopped – 10,000.00\nනතර කළ විට බලපත්‍රය හෝ රියදුරු බලපත්‍රය නොමැති වීම - 10,000.00";
//
//   bool? isChecked8 = false;
//   String fine8 = "Reckless driving without accident – 11,000.00\nඅනතුරකින් තොරව නොසැලකිලිමත් ලෙස රිය පැදවීම - 11,000.00";
//
//   bool? isChecked9 = false;
//   String fine9 = "Car collision by careless driving- 25,000.00\nනොසැලකිලිමත් ලෙස රිය පැදවීමෙන් මෝටර් රථ ගැටීම - 25,000.00";
//
//   bool? isChecked10 = false;
//   String fine10 = "Driving without seat belt – 2000.00\nආසන පටි නොමැතිව රිය පැදවීම - 2000.00";
//
//   bool? isChecked11 = false;
//   String fine11 = "Traveling with passengers without wearing seat belts – 2000.00\nආසන පටි පැළඳ නොගෙන මගීන් සමඟ ගමන් කිරීම - 2000.00";
//
//   bool? isChecked12 = false;
//   String fine12 = "Failure to obey traffic signs – 10,000.00\nමාර්ග සංඥා පිළිපැදීමට අපොහොසත් වීම - 10,000.00";
//
//   bool? isChecked13 = false;
//   String fine13 = "Failure to drive to the left when overtaking a vehicle – 5,000.00\nවාහනයක් අභිබවා යාමේදී වමට ධාවනය නොකිරීම - 5,000.00";
//
//   bool? isChecked14 = false;
//   String fine14 = "Overtaking on the left – 5,000.00\nවම් පසින් අභිබවා යාම - 5,000.00";
//
//   bool? isChecked15 = false;
//   String fine15 = "Not allowing other overtaking vehicles to pass – 5,000.00\nවෙනත් අභිබවා යන වාහන පසුකර යාමට ඉඩ නොදීම - 5,000.00";
//
//   bool? isChecked16 = false;
//   String fine16 = "Driving from the station obstructing the road- 4,000.00\nමාර්ගයට බාධා වන පරිදි දුම්රිය ස්ථානයෙන් රිය පැදවීම - 4,000.00";
//
//   bool? isChecked17 = false;
//   String fine17 = "Overtaking where the road is not visible – 9,000.00\nමාර්ගය නොපෙනෙන තැන අභිබවා යාම - 9,000.00";
//
//   bool? isChecked18 = false;
//   String fine18 = "Driving back more than two vehicle lengths to turn – 3,000.00\nහැරවීමට වාහන දිග දෙකකට වඩා පසුපසට ධාවනය කිරීම - 3,000.00";
//
//   bool? isChecked19 = false;
//   String fine19 = "Obstructing the free passage of the vehicle – 5,000.00\nවාහනයේ නිදහස් ගමනට බාධා කිරීම - 5,000.00";
//
//   bool? isChecked20 = false;
//   String fine20 = "Using mobile phone or other electronic device while driving – 10,000.00\nරිය පැදවීමේදී ජංගම දුරකථනය හෝ වෙනත් ඉලෙක්ට්‍රොනික උපකරණයක් භාවිතා කිරීම - 10,000.00";
//
//   bool? isChecked21 = false;
//   String fine21 = "Keeping an electronic device between the driver – 10,000.00ර\nරියදුරු අතර ඉලෙක්ට්රොනික උපාංගයක් තබා ගැනීම - 10,000.00";
//
//
//   @override
//   Widget build(BuildContext context) {
//     screenWidth = MediaQuery.of(context).size.width;
//     screenHeight = MediaQuery.of(context).size.height;
//
//
//     return Scaffold(
//       appBar: AppBar(
//         leading: Container(
//           margin: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: const Color(0xFF005EA3),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: [
//               BoxShadow(
//                 color: const Color.fromARGB(255, 44, 44, 44).withOpacity(0.5),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 // changes position of shadow
//               ),
//             ],
//           ),
//           child: GestureDetector(
//             child: const Icon(Icons.arrow_back),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: screenWidth,
//                 height: screenHeight / 20,
//                 decoration: const BoxDecoration(
//                   color: Color(0xff424750),
//                 ),
//                 child: const Center(
//                   child: Text(
//                     'Select the violation type',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 height: screenHeight / 1.7,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       _checkboxRow(
//                           fine1,
//                           isChecked1, (value) {
//                         setState(() {
//                           isChecked1 = value;
//                           userFinesLibrary().isChecked1 =value;
//                           updateFineAmount(isChecked1!, 10000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine2,
//                           isChecked2, (value) {
//                         setState(() {
//                           isChecked2 = value;
//                           userFinesLibrary().isChecked2 =value;
//                           updateFineAmount(isChecked2!, 20000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine3,
//                           isChecked3, (value) {
//                         setState(() {
//                           isChecked3 = value;
//                           userFinesLibrary().isChecked3 =value;
//                           updateFineAmount(isChecked3!, 10000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine4,
//                           isChecked4, (value) {
//                         setState(() {
//                           isChecked4 = value;
//                           userFinesLibrary().isChecked4 =value;
//                           updateFineAmount(isChecked4!, 30000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine5,
//                           isChecked5, (value) {
//                         setState(() {
//                           isChecked5 = value;
//                           userFinesLibrary().isChecked5 =value;
//                           updateFineAmount(isChecked5!, 5000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine6,
//                           isChecked6, (value) {
//                         setState(() {
//                           isChecked6 = value;
//                           userFinesLibrary().isChecked6 =value;
//                           updateFineAmount(isChecked6!, 2000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine7,
//                           isChecked7, (value) {
//                         setState(() {
//                           isChecked7 = value;
//                           userFinesLibrary().isChecked7 =value;
//                           updateFineAmount(isChecked7!, 10000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine8,
//                           isChecked8, (value) {
//                         setState(() {
//                           isChecked8 = value;
//                           userFinesLibrary().isChecked8 =value;
//                           updateFineAmount(isChecked8!, 11000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine9,
//                           isChecked9, (value) {
//                         setState(() {
//                           isChecked9 = value;
//                           userFinesLibrary().isChecked9 =value;
//                           updateFineAmount(isChecked9!, 25000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine10,
//                           isChecked10, (value) {
//                         setState(() {
//                           isChecked10 = value;
//                           userFinesLibrary().isChecked10 =value;
//                           updateFineAmount(isChecked10!, 2000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine11,
//                           isChecked11, (value) {
//                         setState(() {
//                           isChecked11 = value;
//                           userFinesLibrary().isChecked11 =value;
//                           updateFineAmount(isChecked11!, 2000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine12,
//                           isChecked12, (value) {
//                         setState(() {
//                           isChecked12 = value;
//                           userFinesLibrary().isChecked12 =value;
//                           updateFineAmount(isChecked12!, 10000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine13,
//                           isChecked13, (value) {
//                         setState(() {
//                           isChecked13 = value;
//                           userFinesLibrary().isChecked13 =value;
//                           updateFineAmount(isChecked13!, 5000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine14,
//                           isChecked14, (value) {
//                         setState(() {
//                           isChecked14 = value;
//                           userFinesLibrary().isChecked14 =value;
//                           updateFineAmount(isChecked14!, 5000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine15,
//                           isChecked15, (value) {
//                         setState(() {
//                           isChecked15 = value;
//                           userFinesLibrary().isChecked15 =value;
//                           updateFineAmount(isChecked15!, 5000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine16,
//                           isChecked16, (value) {
//                         setState(() {
//                           isChecked16 = value;
//                           userFinesLibrary().isChecked16 =value;
//                           updateFineAmount(isChecked16!, 4000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine17,
//                           isChecked17, (value) {
//                         setState(() {
//                           isChecked17 = value;
//                           userFinesLibrary().isChecked17 =value;
//                           updateFineAmount(isChecked17!, 9000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine18,
//                           isChecked18, (value) {
//                         setState(() {
//                           isChecked18 = value;
//                           userFinesLibrary().isChecked18 =value;
//                           updateFineAmount(isChecked18!, 3000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine19,
//                           isChecked19, (value) {
//                         setState(() {
//                           isChecked19 = value;
//                           userFinesLibrary().isChecked19 =value;
//                           updateFineAmount(isChecked19!, 5000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine20,
//                           isChecked20, (value) {
//                         setState(() {
//                           isChecked20 = value;
//                           userFinesLibrary().isChecked20 =value;
//                           updateFineAmount(isChecked20!, 10000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                       _checkboxRow(
//                           fine21,
//                           isChecked21, (value) {
//                         setState(() {
//                           isChecked21 = value;
//                           userFinesLibrary().isChecked21 =value;
//                           updateFineAmount(isChecked21!, 10000);
//                         });
//                       }),
//                       const Divider(
//                         height: 10,
//                         color: Color(0xFF005EA3),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               SizedBox(
//                 width: double.infinity,
//                 child: Text(
//                   'Total fine - $total',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       color: Colors.red,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w900),
//                 ),
//               ),
//               const SizedBox(
//                 height: 16,
//               ),
//               MainActionButton(text: "Save", onTap: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=> userFines()));
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _checkboxRow(
//       String text, bool? isChecked, void Function(bool?) onChanged) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Expanded(
//           child: Text(
//             text,
//             style: const TextStyle(fontSize: 15),
//           ),
//         ),
//         Checkbox(
//           // tristate: true,
//           value: isChecked,
//           onChanged: onChanged,
//           activeColor: const Color(0xFF005EA3),
//           side: const BorderSide(
//             // ======> CHANGE THE BORDER COLOR HERE <======
//             color: Color(0xFF005EA3),
//             // Give your checkbox border a custom width
//             width: 1.5,
//           ),
//         ),
//       ],
//     );
//   }
//
//   void updateFineAmount(bool isChecked, int amount) {
//     if (isChecked == true) {
//       total = total + amount;
//       setState(() {
//         userFinesLibrary().total = total;
//       });
//     } else {
//       total = total - amount;
//       setState(() {
//         userFinesLibrary().total = total;
//       });
//     }
//   }
// }
//
// class userFine {
//   final String name;
//   final int amount;
//
//   userFine({required this.name, required this.amount});
// }
