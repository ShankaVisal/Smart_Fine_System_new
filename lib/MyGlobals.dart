class globaldata {
  String driverFirstName = "please scan qr again";
  String driverLastName = "please scan qr again";
  String DriverID = "please scan qr again";
  String driverLicenseNumber = "please scan qr again";
  String vehicleNumber = "Re enter vehicle number";


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
