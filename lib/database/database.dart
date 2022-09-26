import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];
  // reference the box
  final _myBox = Hive.box('mybox');

  // this method will be run in the first time ever opening the app
  void createInitialData() {
    toDoList = [
      ["pencet tombol dibawah ya cantik untuk add todo list nya", false],
      ["bisa diceklis juga kalau task kamu udah selesai", true],
      ["slide ke kiri pada task untuk hapus task kamu ya", false]
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update data from database
  void updateDatabase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
