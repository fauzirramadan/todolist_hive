import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // list todo
  List toDoList = [
    ["bersih rumah", true],
    ["belajar", false]
  ];

  // checkbox ontapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save new task
  void saveNewTask() {
    if (_keyForm.currentState!.validate()) {
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
      });
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
      toDoList.removeAt(index);
    });
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
              "Ara's Todo",
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
      body: toDoList.isEmpty
          ? Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Text(
                  "Pencet tombol dibawah ya cantik untuk nambahin todo list nya",
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) {
                return ToDoTile(
                  taskName: toDoList[index][0],
                  isCompleted: toDoList[index][1],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteTask: (context) => deleteTask(index),
                );
              },
            ),
    );
  }
}
