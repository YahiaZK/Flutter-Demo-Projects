import 'package:flutter/material.dart';

import '../models/quotes_model.dart';
import '../services/quote_service.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  Quote? _quote;
  final quoteService = QuoteService('e5TJboSrdfso2138yz9Rwg==pXQ8uhGhnaiLm9RO');
  _fetchQuote() async {
    try {
      setState(() {
        _quote = null;
      });
      final qoute = await quoteService.getQuote();
      setState(() {
        _quote = qoute;
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
      appBar: AppBar(title: Text('Quotely'), centerTitle: true),
      body: Center(
        child: _quote == null
            ? CircularProgressIndicator(color: Colors.blue)
            : Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text(_quote?.quote ?? ""),
                    Text(_quote?.author ?? ""),
                    Text(_quote?.work ?? ""),
                  ],
                ),
              ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _fetchQuote();
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }
}
