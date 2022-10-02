import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todolist_hive/database/database.dart';
import 'package:todolist_hive/utils/colors.dart';
import 'package:todolist_hive/utils/dialog_box.dart';

import '../utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  // reference database
  final _myBox = Hive.box('mybox');

  ToDoDatabase db = ToDoDatabase();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  // checkbox ontapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  // save new task
  void saveNewTask() {
    if (_keyForm.currentState!.validate()) {
      setState(() {
        db.toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      db.updateDatabase();
      Navigator.pop(context);
    }
  }

  // create a new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (_) => DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              keyForm: _keyForm,
            ));
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color1,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Nelaa's Todo",
              style: TextStyle(fontWeight: FontWeight.w600, color: textColor),
            ),
            SizedBox(
              width: 2,
            ),
            Icon(
              Icons.favorite,
              color: textColor,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color2,
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
      body: db.toDoList.isEmpty
          ? Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  "NO TASK",
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              itemCount: db.toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: db.toDoList[index][0],
                  isCompleted: db.toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
