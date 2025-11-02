import 'package:flutter/material.dart';

import '../models/quotes_model.dart';
import '../services/quote_service.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Quote? _qoute;
  final quoteService = QuoteService('e5TJboSrdfso2138yz9Rwg==pXQ8uhGhnaiLm9RO');
  _fetchQuote() async {
    try {
      setState(() {
        _qoute = null;
      });
      final qoute = await quoteService.getQuote();
      setState(() {
        _qoute = qoute;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text(_qoute?.quote ?? "Loading qoute ...."),
              Text(_qoute?.author ?? "Loading author ...."),
              Text(_qoute?.work ?? "Loading work ...."),
            ],
          ),
        ),
      ),
    );
  }
}
