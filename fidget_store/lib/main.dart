import 'package:fidget_store/models/cart_model.dart';
import 'package:fidget_store/screens/my_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Fidget Store Demo',
        debugShowCheckedModeBanner: false,
        home: MyHomeScreen(),
      ),
    );
  }
}
