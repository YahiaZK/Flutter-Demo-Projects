import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/weather_model.dart';
import 'screens/my_home_screen.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(WeatherAdapter());
  await Hive.openBox<Weather>('weatherBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather app demo',
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}
