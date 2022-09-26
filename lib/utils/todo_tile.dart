import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteTask;

  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged,
      required this.deleteTask});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // checkbox
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              // task name
              Flexible(
                child: Text(
                  taskName,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
