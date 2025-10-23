import 'package:flutter/material.dart';

class AddExpenseDialog extends StatelessWidget {
  final TextEditingController expenseNameController;
  final TextEditingController expenseAmountController;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const AddExpenseDialog({
    super.key,
    required this.expenseNameController,
    required this.expenseAmountController,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add an Expense'),
      content: SizedBox(
        width: 300,
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: expenseNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('New Expense'),
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: expenseAmountController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Amount'),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: onCancel, child: Text('CANCEL')),
        TextButton(onPressed: onSave, child: Text('ADD')),
      ],
    );
  }
}
