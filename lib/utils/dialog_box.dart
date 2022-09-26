import 'package:flutter/material.dart';
import 'package:todolist_hive/utils/colors.dart';
import 'package:todolist_hive/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  final GlobalKey<FormState> keyForm;
  final VoidCallback onSave;
  final TextEditingController controller;
  const DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.keyForm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      backgroundColor: color1,
      content: Form(
        key: keyForm,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 180,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                style: const TextStyle(fontSize: 15),
                validator: (value) {
                  return controller.value.text.isEmpty
                      ? "Isi dulu ya cantik"
                      : null;
                },
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none),
                    hintText: "Mau ngapain hari ini?",
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
      ),
    );
  }
}
