import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'MongoDbModelEditForLicense.dart';
import '../dbHelper/mongodb.dart';


class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({super.key});

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {

  var fnameController = new TextEditingController();
  var lnameController = new TextEditingController();
  var dobController = new TextEditingController();
  var doiController = new TextEditingController();
  var doeController = new TextEditingController();
  var idNumController = new TextEditingController();
  var licenseNumController = new TextEditingController();
  var addressController = new TextEditingController();
  var vehicleCategoryController = new TextEditingController();


  var _checkInsertUpdate = 'Insert';

  @override
  Widget build(BuildContext context) {

    MongoDbModel1? data = ModalRoute.of(context)!.settings.arguments as MongoDbModel1?;
    if(data !=null){
      fnameController.text = data.firstName;
      lnameController.text = data.lastName;
      dobController.text = data.DOB;
      doiController.text = data.DOI;
      doeController.text = data.DOE;
      idNumController.text = data.IDnum;
      licenseNumController.text = data.licenseNum;
      addressController.text = data.address;
      vehicleCategoryController.text = data.vehicleCategory;
      _checkInsertUpdate = 'Update';
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Text(_checkInsertUpdate, style: const TextStyle(fontSize: 22),),
              const SizedBox(height: 50,),
              TextField(
                controller: fnameController,
                decoration: const InputDecoration(
                    labelText: 'First Name'
                ),
              ),
              TextField(
                controller: lnameController,
                decoration: const InputDecoration(
                    labelText: 'Last Name'
                ),
              ),
              TextField(
                controller: dobController,
                decoration: const InputDecoration(
                    labelText: 'Date Of Birth'
                ),
              ),
              TextField(
                controller: doiController,
                decoration: const InputDecoration(
                    labelText: 'Date Of issue'
                ),
              ),
              TextField(
                controller: doeController,
                decoration: const InputDecoration(
                    labelText: 'Date Of Expiry'
                ),
              ),
              TextField(
                controller: idNumController,
                decoration: const InputDecoration(
                    labelText: 'ID Number'
                ),
              ),
              TextField(
                controller: licenseNumController,
                decoration: const InputDecoration(
                    labelText: 'License Number'
                ),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                    labelText: 'Address'
                ),
              ),
              TextField(
                controller: vehicleCategoryController,
                decoration: const InputDecoration(
                    labelText: 'Vehicle Category'
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: (){
                      _insertData(fnameController.text,lnameController.text,dobController.text,doiController.text,doeController.text,idNumController.text,licenseNumController.text,addressController.text,vehicleCategoryController.text);
                  },
                  child: Text(_checkInsertUpdate)),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateData( var  id, String fName, String lName, String dob, String doi, String doe, String idNum, String licenseNum,String address, String category) async{
    final updateData = MongoDbModel1(id: id, firstName: fName, lastName: lName, DOB: dob, DOI: doi, DOE: doe, IDnum: idNum, licenseNum: licenseNum, address: address, vehicleCategory: category);
  }

  Future<void> _insertData(String fName, String lName, String dob, String doi, String doe, String idNum, String licenseNum,String address, String category)async {
    var _id = M.ObjectId();
    final data = MongoDbModel1(id: _id, firstName: fName, lastName: lName, DOB: dob, DOI: doi, DOE: doe, IDnum: idNum, licenseNum: licenseNum, address: address, vehicleCategory: category);
    var result = await MongoDatabase.insert(data);
    ScaffoldMessenger.of(context)
        .showSnackBar((SnackBar(content: Text('Insertd ID' + _id.$oid))));
    _clearAll();
  }

  void _clearAll(){
    fnameController.text = "";
    lnameController.text = "";
    dobController.text = "";
    doiController.text = "";
    dobController.text = "";
    idNumController.text = "";
    licenseNumController.text = "";
    addressController.text = "";
    vehicleCategoryController.text = "";

  }

}