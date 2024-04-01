class Fine {
  final String name;
  final int amount;
  bool isChecked;

  Fine(this.name, this.amount, this.isChecked);
}
  List<Fine> fines = [
    Fine("Driving without registration\nවැරදි අංක තහඩු සහිතව රිය පැදවීම", 10000, false),
    Fine("Driving without insurance\nරක්ෂණයකින් තොරව රිය පැදවීම", 20000, false),
    Fine("Driving with wrong number plates\nවැරදි අංක තහඩු සහිතව රිය පැදවීම", 10000, false),
    Fine("Using the car regardless of the terms of the licensen\nබලපත්‍රයේ නියමයන් නොසලකා මෝටර් රථය භාවිතා කිරීම", 30000, false),
    Fine("Driving without a driver’s license or license without plates\nරියදුරු බලපත්‍රයක් හෝ තහඩු නොමැතිව බලපත්‍රයක් නොමැතිව රිය පැදවීම", 5000, false),
    Fine("Driving without a license or driver’s license\nබලපත්රයක් හෝ රියදුරු බලපත්රයක් නොමැතිව රිය පැදවීම", 2000, false),
    Fine("Not having license or driver’s license when stopped\nනතර කළ විට බලපත්‍රය හෝ රියදුරු බලපත්‍රය නොමැති වීම", 10000, false),
    Fine("Reckless driving without accident\nඅනතුරකින් තොරව නොසැලකිලිමත් ලෙස රිය පැදවීම", 11000, false),
    Fine("Car collision by careless driving\nනොසැලකිලිමත් ලෙස රිය පැදවීමෙන් මෝටර් රථ ගැටීම", 25000, false),
    Fine("Driving without seat belt\nආසන පටි නොමැතිව රිය පැදවීම", 2000, false),
    Fine("Traveling with passengers without wearing seat belts\nආසන පටි පැළඳ නොගෙන මගීන් සමඟ ගමන් කිරීම", 2000, false),
    Fine("Failure to obey traffic signs\nමාර්ග සංඥා පිළිපැදීමට අපොහොසත් වීම", 10000, false),
    Fine("Failure to drive to the left when overtaking a vehicle\nවාහනයක් අභිබවා යාමේදී වමට ධාවනය නොකිරීම", 5000, false),
    Fine("Overtaking on the left\nවම් පසින් අභිබවා යාම", 5000, false),
    Fine("Not allowing other overtaking vehicles to pass\nවෙනත් අභිබවා යන වාහන පසුකර යාමට ඉඩ නොදීම", 5000, false),
    Fine("Driving from the station obstructing the road\nමාර්ගයට බාධා වන පරිදි දුම්රිය ස්ථානයෙන් රිය පැදවීම", 4000, false),
    Fine("Overtaking where the road is not visible\nමාර්ගය නොපෙනෙන තැන අභිබවා යාම", 9000, false),
    Fine("Driving back more than two vehicle lengths to turn\nහැරවීමට වාහන දිග දෙකකට වඩා පසුපසට ධාවනය කිරීම", 3000, false),
    Fine("Obstructing the free passage of the vehicle\nවාහනයේ නිදහස් ගමනට බාධා කිරීම", 5000, false),
    Fine("Using mobile phone or other electronic device while driving\nරිය පැදවීමේදී ජංගම දුරකථනය හෝ වෙනත් ඉලෙක්ට්‍රොනික උපකරණයක් භාවිතා කිරීම", 10000, false),
    Fine("Keeping an electronic device between the driver\nරියදුරු අතර ඉලෙක්ට්රොනික උපාංගයක් තබා ගැනීම", 10000, false),
  ];

  // You can now use the fines list in your application

