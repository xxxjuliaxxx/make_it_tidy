// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:make_it_tidy/custom_widgets/todo_tile.dart';

class TodoGridView extends StatefulWidget {
  List<String> todoList;
  TodoGridView({Key? key, required this.todoList}) : super(key: key);

  @override
  State<TodoGridView> createState() => _TodoGridViewState();
}

class _TodoGridViewState extends State<TodoGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.todoList.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoTile(
            title: widget.todoList[index][0],
            description: widget.todoList[index][1]);
      },
    );
  }
}
