import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/database.dart';
import '../utils/dialog_box.dart';
import '../utils/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box('mybox');

  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = value!;
    });
    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          final taskName = db.toDoList[index][0];
          return ToDoTile(
            key: ValueKey(taskName),
            taskName: taskName,
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteTask: (context) {
              setState(() {
                db.toDoList.removeAt(index);
              });
              db.updateDataBase();
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
