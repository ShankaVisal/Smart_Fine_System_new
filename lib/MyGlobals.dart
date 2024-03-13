class globaldata {
  String driverFirstName = "";
  String driverLastName = "";
  String DriverID = "";
  String driverLicenseNumber = "kg";
  String vehicleNumber = "sss";
  String vehicleCategory = "";


  // Singleton pattern
  static final globaldata _singleton = globaldata._internal();

  factory globaldata() {
    return _singleton;
  }

  globaldata._internal();

  updateVehicleNumber(String newVehicleNumber) {
    vehicleNumber = newVehicleNumber;
  }
}
