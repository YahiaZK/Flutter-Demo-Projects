import 'package:expense_tracker_local_storage/utils/add_expense_dialog.dart';
import 'package:flutter/material.dart';

import '../utils/expense_tile.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  double expenses = 0.0;

  List expenseList = [
    ['Train Ticket', 100],
    ['Lunch', 15.50],
    ['Groceries', 74.25],
    ['Coffee', 4.75],
    ['Movie Night', 32.00],
    ['Gas Bill', 55.80],
    ['Internet Bill', 65.00],
  ];

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    '\$$expenses',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: expenseList.length,
                  itemBuilder: (context, index) {
                    expenses += expenseList[index][1];
                    return ExpenseTile(
                      expenseName: expenseList[index][0],
                      expenseValue: (expenseList[index][1] as num).toDouble(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddExpenseDialog(
                controller: _controller,
                onSave: () {},
                onCancel: () {},
              );
            },
          );
        },
      ),
    );
  }
}
