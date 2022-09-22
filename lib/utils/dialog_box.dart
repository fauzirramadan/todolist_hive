import 'package:flutter/material.dart';
import 'package:todolist_hive/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final VoidCallback onSave;
  final TextEditingController controller;
  const DialogBox({super.key, required this.controller, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: Colors.yellow[400],
      content: Container(
        padding: const EdgeInsets.all(8),
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  hintText: "Add a new task",
                  filled: true,
                  fillColor: Colors.black.withOpacity(0.1)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 8,
                ),
                // cancel button
                MyButton(
                    text: "Cancel",
                    onPressed: () => Navigator.of(context).pop())
              ],
            )
          ],
        ),
      ),
    );
  }
}
