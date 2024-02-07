import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class policeOfficerDetails extends StatefulWidget {
  const policeOfficerDetails({super.key});

  @override
  State<policeOfficerDetails> createState() => _policeOfficerDetailsState();
}

class _policeOfficerDetailsState extends State<policeOfficerDetails> {
  TextEditingController firstName = TextEditingController();
  TextEditingController secondName = TextEditingController();
  TextEditingController policeID = TextEditingController();
  TextEditingController policeStation = TextEditingController();
  TextEditingController rank = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Police Office Details'),
      ),
      body: Column(
        children: [
          TextField(
            controller: firstName,
            decoration:
                InputDecoration(labelText: 'firstName', hintText: 'firstName'),
          ),
          TextField(
            controller: secondName,
            decoration: InputDecoration(
                labelText: 'secondName', hintText: 'secondName'),
          ),
          TextField(
            controller: policeID,
            decoration:
                InputDecoration(labelText: 'policeID', hintText: 'policeID'),
          ),
          TextField(
            controller: policeStation,
            decoration: InputDecoration(
                labelText: 'policeStation', hintText: 'policeStation'),
          ),
          TextField(
            controller: rank,
            decoration: InputDecoration(labelText: 'rank', hintText: 'rank'),
          ),
          ElevatedButton(
            onPressed: () {
              createUser(
                  firstName: firstName.text,
                  secondName: secondName.text,
                  policeID: policeID.text,
                  policeStation: policeStation.text,
                  rank: rank.text
              );
              Navigator.pop(context);
            },
            child: Text('Add Details'),
          )
        ],
      ),
    );
  }

  Future createUser(
      {required String firstName,
      required String secondName,
      required String policeID,
      required String policeStation,
      required String rank}) async {
    final docUser = FirebaseFirestore.instance
        .collection('Police Officers')
        .doc(FirebaseAuth.instance.currentUser!.uid);

    final json = {
      'userid' : docUser.id,
      'firstName': firstName,
      'secondName': secondName,
      'policeID': policeID,
      'policeStation': policeStation,
      'rank': rank,
    };

    try {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Add User Details Successfully')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error Creating User : $e')));
    }
    await docUser.set(json);
  }
}
