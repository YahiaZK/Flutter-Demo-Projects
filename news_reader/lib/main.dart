import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_reader/models/article.dart';
import 'package:news_reader/models/news_model.dart';

import 'screens/my_home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(NewsResponseAdapter()); 
  Hive.registerAdapter(ArticleAdapter());

  await Hive.openBox<NewsResponse>('newsReader');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Reader demo',
      debugShowCheckedModeBanner: false,
      home: MyHomeScreen(),
    );
  }
}
