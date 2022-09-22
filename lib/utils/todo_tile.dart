import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;

  const ToDoTile(
      {super.key,
      required this.taskName,
      required this.isCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
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
    );
  }
}
