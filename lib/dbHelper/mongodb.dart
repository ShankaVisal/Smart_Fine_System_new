import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import '../Fines/fines.dart';
import '../LicenseDataBase/MongoDbModelEditForLicense.dart';
import '../MyGlobals.dart';
import 'constant.dart';

class MongoDatabase{
  static var db, db_RE, userCollection, collection_RE,  FINES_DB;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);

    db_RE = await Db.create(MONGO_RE_LI_CONN_URL);
    await db_RE.open();
    inspect(db_RE);
    collection_RE = db_RE.collection(RE_LI_COLLECTION);
    FINES_DB = db_RE.collection(USER_FINES);

  }

  static Future<List<Map<String,dynamic>>> getData() async{
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<List<Map<String,dynamic>>> getDataFromRevenue(String vehicle_num) async{
    final arrDataRE = await collection_RE.find(where.eq('vehicle_number', vehicle_num)).toList();
    return arrDataRE;
  }

  // static Future<void> Update(MongoDbModel data) async{
  //   var result = await userCollection.findOne({"_id" : data.id});
  //   result['firstName'] = data.firstName;
  //   result['lastName'] = data.lastName;
  //   result['address'] = data.address;
  //   var response = await userCollection.save(result);
  //   inspect(response);
  // }



  static Future<String> insert(MongoDbModel1 data) async{
    try{
      var result = await userCollection.insertOne(data.toJson());
      if(result.isSucess){
        return 'Data Inserted';
      }else{
        return'Something Wrong while inserting data';
      }
    } catch(e){
      print(e.toString());
      return e.toString();
    }
  }

  static Future<void> saveFinesToDatabase(int total) async {
    db_RE = await Db.create(MONGO_RE_LI_CONN_URL);
    await db_RE.open();
    inspect(db_RE);
    FINES_DB = db_RE.collection(USER_FINES);

    // Get driver's information
    String driverFirstName = globaldata().driverFirstName;
    String driverLastName = globaldata().driverLastName;
    String driverLicenseNumber = globaldata().driverLicenseNumber;
    String DriverID = globaldata().DriverID;
    String vehicleNumber = globaldata().vehicleNumber;

    // Create a list to store fines
    List<Map<String, dynamic>> finesList = [];

    // Iterate over fines
    for (var fine in fines) {
      if (fine.isChecked) {
        finesList.add({
          'name': fine.name,
          'amount': fine.amount,
        });
      }
    }

    // Get the current date
    DateTime currentDate = DateTime.now();
    // Format the date to include only the date part without the time
    String formattedDate = "${currentDate.year}-${currentDate.month}-${currentDate.day}";


    // Create the document to be inserted
    final Map<String, dynamic> finesDocument = {
      'driverFirstName': driverFirstName,
      'driverLastName': driverLastName,
      'driverLicenseNumber': driverLicenseNumber,
      'driverID': DriverID,
      'vehicleNumber': vehicleNumber,
      'totalFine' : total,
      'date' : formattedDate,
      'fines': finesList, // Add the list of fines
    };

    // Insert the document into the database
    await db_RE.collection(USER_FINES).insert(finesDocument);

    await db_RE.close();
    print('Fines added to MongoDB');
  }

}