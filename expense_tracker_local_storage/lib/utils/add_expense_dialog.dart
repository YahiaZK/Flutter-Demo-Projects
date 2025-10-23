import 'package:flutter/material.dart';

class AddExpenseDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  const AddExpenseDialog({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add an Expense'),
      content: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('Add new Expense'),
          ),
        ),
      ),
      actions: [
        ElevatedButton(onPressed: onCancel, child: Text('CANCEL')),
        ElevatedButton(onPressed: onSave, child: Text('ADD')),
      ],
    );
  }
}
