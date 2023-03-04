import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_apps/exception/exception.dart';
import 'package:weather_apps/models/weather_model.dart';
import 'package:weather_apps/services/services_pages.dart';

import '../providers/weather_provider.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (data) async {
              try {
                cityName = data;
                WeatherService service = WeatherService();
                WeatherModele1 weather =
                    await service.getWeather(cityName: cityName!);
                // ignore: use_build_context_synchronously
                Provider.of<WeatherProvider>(context, listen: false)
                    .weatherData = weather;
                Navigator.pop(context);
              } catch (e) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return const Exec();
                }));
              }
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              label: Text('Search'),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              hintText: 'Enter a city here',
              hintTextDirection: TextDirection.ltr,
            ),
          ),
        ),
      ),
    );
  }
}
