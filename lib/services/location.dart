
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
class Location{

  late double latitude;
  late double longitude;

  Future<void> getLocation() async {

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      latitude=position.latitude;
      longitude=position.longitude;

    }
    catch(e){
      print("LOcation denied!");
    }


  }


}