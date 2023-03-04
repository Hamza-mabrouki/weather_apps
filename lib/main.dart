import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_apps/providers/weather_provider.dart';

import 'Pages/homepage.dart';

void main(List<String> args) {
  runApp(const Weather_Apps());
}

class Weather_Apps extends StatelessWidget {
  const Weather_Apps({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return WeatherProvider();
      },
      child: MaterialApp(
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
