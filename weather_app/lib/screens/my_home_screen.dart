import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/weather_model.dart';
import '../services/weather_service.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final _weatherService = WeatherService('90df102bf867add6b0a9155ce3dd5104');

  Weather? _weather;

  final _weatherBox = Hive.box<Weather>('weatherBox');

  _fetchWeather() async {
    setState(() {
      _weather = null;
    });

    try {
      String cityName = await _weatherService.getCurrentCity();
      final weather = await _weatherService.getWeather(cityName);

      _weatherBox.put('currentweather', weather);

      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print("Could not fetch from API. Loading from cache.");
      print(e);

      final cachedWeather = _weatherBox.get('currentweather');
      if (cachedWeather != null) {
        setState(() {
          _weather = cachedWeather;
        });
      }
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) {
      return 'assets/Weather-sunny.json';
    }

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/Weather-cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/Weather-rainy.json';
      case 'thunderstorm':
        return 'assets/Weather-storm.json';
      case 'clear':
        return 'assets/Weather-sunny.json';
      default:
        return 'assets/Weather-sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_weather?.cityName ?? "loading city... "),

            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            Text('${_weather?.temp.round()}°C'),

            Text(_weather?.mainCondition ?? ""),
          ],
        ),
      ),
    );
  }
}
