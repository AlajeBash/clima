import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  final longitude = .12313123;
  final latitude = 50.123123;

  final weatherData = await getWeather(longitude, latitude);

  print('Temperature: ${weatherData.temperature}');
  print('Condition: ${weatherData.condition}');
  print('Condition: ${weatherData.conditionID}');
  print('City Name: ${weatherData.cityname}');
}


Future<WeatherData> getWeather(double longitude, double latitude) async {
  final apiKey = '6ffcd7b427cfe3ffcffe8ffbdb615e82';
  final url =
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body) as Map<String, dynamic>;

    // Extract temperature and condition from jsonData
    final double temperature = jsonData['main']['temp']; // Main temp data
    final String condition =
        jsonData['weather'][0]['description']; // Weather condition description
    final int conditionID =
        jsonData['weather'][0]['id']; // Weather condition ID
    final String cityname = jsonData['name'];
    return WeatherData(
        temperature: temperature,
        condition: condition,
        conditionID: conditionID,
        cityname: cityname);
  } else {
    throw Exception('Failed to load weather data');
  }
}

class WeatherData {
  double temperature;
  String condition;
  int conditionID;
  String cityname;

  // Constructor to initialize fields
  WeatherData(
      {required this.temperature,
      required this.condition,
      required this.conditionID,
      required this.cityname});
}


getLocation() async {
  Location location = Location();
  await location.getCurrentLocation();
  print(location.latitude);
  print(location.longitute);
}

void getData() async {
  http.Response response = Uri.https(
      'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=6ffcd7b427cfe3ffcffe8ffbdb615e82')
  as http.Response;
  if (response.statusCode == 200) {
    String data = response.body;
    print(data);

    var longtitude = jsonDecode(data)['coord']['lon'];

    var weather = jsonDecode(data)['weather'][0]['description'];
  } else {
    print(response.statusCode);
  }
}

@
void getData() async {

  final url =
      'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
    var decodedData = jsonDecode(data);

    // Extract temperature and condition from jsonData
    final double temperature = jsonData['main']['temp']; // Main temp data
    final String condition =
    jsonData['weather'][0]['description']; // Weather condition description
    final int conditionID =
    jsonData['weather'][0]['id']; // Weather condition ID
    final String cityname = jsonData['name'];
    return WeatherData(
        temperature: temperature,
        condition: condition,
        conditionID: conditionID,
        cityname: cityname);
  } else {
    throw Exception('Failed to load weather data');
  }
}