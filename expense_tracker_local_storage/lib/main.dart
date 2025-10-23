import 'package:flutter/material.dart';

import 'screen/my_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});   

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: MyHomeScreen(),
    );
  }
}
