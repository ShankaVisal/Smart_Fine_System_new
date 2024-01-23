import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import '../LicenseDataBase/MongoDbModelEditForLicense.dart';
import 'constant.dart';

class MongoDatabase{
  static var db, db_RE, userCollection, collection_RE ;
  static connect() async{
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);

    db_RE = await Db.create(MONGO_RE_LI_CONN_URL);
    await db_RE.open();
    inspect(db_RE);
    collection_RE = db_RE.collection(RE_LI_COLLECTION);
  }

  static Future<List<Map<String,dynamic>>> getData() async{
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<List<Map<String,dynamic>>> getDataFromRevenue() async{
    final arrDataRE = await collection_RE.find().toList();
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
}