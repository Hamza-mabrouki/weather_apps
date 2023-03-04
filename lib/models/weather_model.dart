import 'package:flutter/material.dart';

class WeatherModele1 {
  String? date;
  String? name;
  double? temp;
  double? maxtemp;
  double? mintemp;
  String? weatherStateName;
  WeatherModele1(
      {required this.date,
      required this.name,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.weatherStateName});
  factory WeatherModele1.fromJson(dynamic data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    //print(data);

    return WeatherModele1(
        date: data['location']['localtime'],
        name: data['location']['name'],
        temp: jsonData['avgtemp_c'],
        maxtemp: jsonData['maxtemp_c'],
        mintemp: jsonData['mintemp_c'],
        weatherStateName: jsonData['condition']['text']);
  }

  @override
  String toString() {
    return 'temp = $temp minTemp = $mintemp maxTemp = $maxtemp date = $date ';
  }

  String getImage() {
    switch (weatherStateName) {
      case 'Sunny':
        return 'assets/image/weather/64x64/day/395.png';
      default:
        return 'assets/image/download (1).png';
    }
  }

  Color getColor() {
    switch (weatherStateName) {
      case 'Sunny':
        return Colors.orange;
      default:
        return Colors.yellow;
    }
  }
}
