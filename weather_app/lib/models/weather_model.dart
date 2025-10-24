import 'package:hive/hive.dart';

part 'weather_model.g.dart'; 

@HiveType(typeId: 0)
class Weather {
  @HiveField(0)
  final String cityName;
  @HiveField(1)
  final double temp;
  @HiveField(2)
  final String mainCondition;

  const Weather({
    required this.cityName,
    required this.temp,
    required this.mainCondition,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
    );
  }
}
