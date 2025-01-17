import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitute;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitute = position.longitude;
      print(latitude);
      print(longitute);
    } catch (e) {
      print(e);
    }
  }
}
