import 'package:flutter/material.dart';

import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List toDoList = [
    ['task one', true],
    ['task two', false],
    ['task three', true],
  ];
  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value!;
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onDelete: () {
            _controller.clear();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          final taskName = toDoList[index][0];
          return ToDoTile(
            key: ValueKey(taskName),
            taskName: taskName,
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context){
              setState(() {
              toDoList.removeAt(index);
              });
            },
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        shape: CircleBorder(),
        child: Icon(Icons.add),
      ),
    );
  }
}
