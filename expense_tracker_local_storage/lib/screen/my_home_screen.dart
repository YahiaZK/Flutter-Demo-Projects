import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../utils/expense_tile.dart';
import '../utils/add_expense_dialog.dart';
import '../data/database.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  final _myBox = Hive.box('expensesbox');
  var db = ExpenseDatabase();

  double expenses = 0.0;

  final _expenseNameController = TextEditingController();
  final _expenseAmountController = TextEditingController();

  void calculateTotalExpenses() {
    double total = 0.0;

    total = db.expenseList.fold(0.0, (double sum, item) {
      return sum + (item[1] as num);
    });

    setState(() {
      expenses = total;
    });
  }

  @override
  void initState() {
    super.initState();
    if (_myBox.get('EXPENSEDATABASE') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    calculateTotalExpenses();
  }

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
              SizedBox(height: 25),
              Card(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    '\$$expenses',
                    style: Theme.of(
                      context,
                    ).textTheme.headlineMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: db.expenseList.length,
                  itemBuilder: (context, index) {
                    return ExpenseTile(
                      expenseName: db.expenseList[index][0],
                      expenseValue: (db.expenseList[index][1] as num)
                          .toDouble(),
                      onDelete: (context) {
                        setState(() {
                          db.expenseList.removeAt(index);
                          calculateTotalExpenses();
                        });
                        db.updateData();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AddExpenseDialog(
                expenseAmountController: _expenseAmountController,
                expenseNameController: _expenseNameController,
                onSave: () {
                  setState(() {
                    final amount = double.tryParse(
                      _expenseAmountController.text,
                    );

                    db.expenseList.add([_expenseNameController.text, amount]);

                    _expenseAmountController.clear();
                    _expenseNameController.clear();
                    calculateTotalExpenses();
                  });
                  db.updateData();
                  Navigator.of(context).pop();
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
      ),
    );
  }
}
