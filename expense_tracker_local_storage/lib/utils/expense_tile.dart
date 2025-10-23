import 'package:flutter/material.dart';

class ExpenseTile extends StatelessWidget {
  final String expenseName;
  final double expenseValue;
  const ExpenseTile({
    super.key,
    required this.expenseName,
    required this.expenseValue,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.labelLarge;

    return Card(
      color: Colors.white70,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(expenseName, style: style),
            Text('\$$expenseValue', style: style),
          ],
        ),
      ),
    );
  }
}
