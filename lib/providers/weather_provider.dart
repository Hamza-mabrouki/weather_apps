import 'package:flutter/material.dart';
import 'package:weather_apps/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModele1? _weatherData;
  set weatherData(WeatherModele1? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModele1? get weatherData {
    return _weatherData;
  }
}
