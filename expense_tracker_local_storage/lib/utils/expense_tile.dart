import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String expenseName;
  final double expenseValue;
  final Function(BuildContext)? onDelete;
  const ExpenseTile({
    super.key,
    required this.expenseName,
    required this.expenseValue,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(color: Colors.white);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              icon: Icons.delete,
              backgroundColor: Colors.red,
              onPressed: onDelete,
              borderRadius: BorderRadius.circular(25),
            ),
          ],
        ),
        child: Container(
          // color: Colors.white70,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expenseName, style: style),
                Text('\$$expenseValue', style: style),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
