import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteTask,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteTask,
                icon: Icons.delete,
                backgroundColor: Colors.red,
                borderRadius: BorderRadius.circular(15),
              ),
            ],
          ),
          child: Card(
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Checkbox(value: taskCompleted, onChanged: onChanged),
                  Text(
                    taskName,
                    style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontWeight: taskCompleted
                          ? FontWeight.normal
                          : FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
