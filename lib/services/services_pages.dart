import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_apps/models/weather_model.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '468011badd2b4ee4af8210120232202';
  Future<WeatherModele1> getWeather({required String cityName}) async {
    Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    //print(data);
    WeatherModele1 weather = WeatherModele1.fromJson(data);
    return weather;
  }
}
