import 'package:mongo_dart/mongo_dart.dart';
import 'dart:convert';

MongoDbModel1 mongoDbModelFromJson(String str) =>
    MongoDbModel1.fromJson(json.decode(str));

class MongoDbModel1 {
  MongoDbModel1({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.DOB,
    required this.DOI,
    required this.DOE,
    required this.IDnum,
    required this.licenseNum,
    required this.address,
    required this.vehicleCategory,
  });
  ObjectId id;
  String firstName;
  String lastName;
  String DOB;
  String DOI;
  String DOE;
  String IDnum;
  String licenseNum;
  String address;
  String vehicleCategory;

  factory MongoDbModel1.fromJson(Map<String, dynamic> json) => MongoDbModel1(
    id: json['_id'],
    firstName: json['firstName'],
    lastName: json['lastName'],
    DOB: json['DOB'],
    DOI: json['DOI'],
    DOE: json['DOE'],
    IDnum: json['IDnum'],
    licenseNum: json['licenseNum'],
    address: json['address'],
    vehicleCategory: json['vehicleCategory'],

  );

  Map<String, dynamic> toJson() => {
    '_id': id,
    'firstName': firstName,
    'lastName': lastName,
    'DOB': DOB,
    'DOI': DOI,
    'DOE': DOE,
    'IDnum': IDnum,
    'licenseNum': licenseNum,
    'address': address,
    'vehicleCategory':vehicleCategory,



  };
}

//eq45yq5ryrq5ywruhw6rhujrw6ysjsrydytjkdytjkgdyjkduytjkdujkdutjk8