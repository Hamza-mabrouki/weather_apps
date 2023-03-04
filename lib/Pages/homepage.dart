import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_apps/Pages/searchpage.dart';
import 'package:weather_apps/models/weather_model.dart';
import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    WeatherModele1? weatherData2 =
        Provider.of<WeatherProvider>(context, listen: true).weatherData;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('The weather'),
      ),
      body: weatherData2 == null
          ? const Center(
              child: Text(
                'search for weathers',
                style: TextStyle(fontSize: 34),
              ),
            )
          : Container(
              color: weatherData2.getColor(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                  Text(
                    weatherData2.name ?? 'city',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherData2.date ?? 'hello nega',
                    style: const TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      Image.asset(
                        weatherData2.getImage(),
                        width: 100,
                        height: 100,
                      ),
                      const Spacer(),
                      Text(
                        weatherData2.temp.toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          Text('Maxtemp : ${weatherData2.maxtemp?.toInt()}'),
                          Text('Mintemp : ${weatherData2.mintemp?.toInt()}'),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    weatherData2.weatherStateName ?? 'null',
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
    );
  }
}
