import 'package:geolocator/geolocator.dart';
class Location{
   double? latituade;
    double? longituade;

//   Location(this.latituade,this.longituade){
// }
  Future<void> getCurrentLocation() async {

   try{
     LocationPermission permission;
     permission = await Geolocator.requestPermission();
     Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
     latituade = position.latitude;
     longituade = position.longitude;
  }
   catch(e){
     print(e);
   }
 }

}

