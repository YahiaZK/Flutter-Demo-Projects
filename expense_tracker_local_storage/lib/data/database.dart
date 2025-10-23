import 'package:hive_flutter/hive_flutter.dart';

class ExpenseDatabase {
  List expenseList = [];

  final _myBox = Hive.box('expensesbox');

  void createInitialData() {
    expenseList = [
      ['Train Ticket', 100],
      ['Lunch', 15.50],
      ['Coffee', 4.25],
      ['Groceries', 65.30],
      ['Electricity Bill', 45.00],
      ['Internet Subscription', 30.00],
      ['Movie Ticket', 12.00],
      ['Gym Membership', 25.00],
      ['Taxi Ride', 18.75],
      ['Books', 22.40],
      ['Clothes', 55.60],
      ['Phone Recharge', 10.00],
    ];
  }

  void loadData() {
    expenseList = _myBox.get('EXPENSEDATABASE');
  }

  void updateData() {
    _myBox.put('EXPENSEDATABASE', expenseList);
  }
}
