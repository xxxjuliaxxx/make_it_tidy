import 'package:flutter/material.dart';

class TodoInformationPopup extends StatefulWidget {
  final TextEditingController descriptionController;
  final TextEditingController titleController;

  const TodoInformationPopup(
      {Key? key,
      required this.titleController,
      required this.descriptionController})
      : super(key: key);

  @override
  State<TodoInformationPopup> createState() => _TodoInformationPopupState();
}

class _TodoInformationPopupState extends State<TodoInformationPopup> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color.fromARGB(255, 136, 195, 204),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 20,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "ADD",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.titleController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 70, 67, 67),
                      fontWeight: FontWeight.bold),
                  labelText: "Title",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                controller: widget.descriptionController,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 107, 99, 99),
                      fontWeight: FontWeight.bold),
                  labelText: "Description",
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 216, 96, 136),
                  textStyle: const TextStyle(fontWeight: FontWeight.bold)),
              child: const Text("ADD"),
              onPressed: () => Navigator.pop(context, false),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
