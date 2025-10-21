
import 'package:flutter/material.dart';

import 'screens/my_home_screen.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)),
      home: MyHomeScreen(),
    );
  }
}

