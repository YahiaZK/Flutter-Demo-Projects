import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSave;
  final VoidCallback onDelete;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Add New Task')),
      content: SizedBox(
        width: 250,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Add new task',
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: onDelete, child: Text('CANCEL')),
            SizedBox(width: 15),
            ElevatedButton(onPressed: onSave, child: Text('ADD')),
          ],
        ),
      ],
    );
  }
}
