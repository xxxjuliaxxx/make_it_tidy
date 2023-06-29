// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:make_it_tidy/custom_widgets/todo_tile.dart';

class TodoGridView extends StatefulWidget {
  final List list;
  TodoGridView({
    Key? key,
    required this.list,
  }) : super(key: key);

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
      itemCount: widget.list.length,
      itemBuilder: (BuildContext context, int index) {
        return TodoTile(
            title: widget.list[index]["title"],
            description: widget.list[index]["description"]);
      },
    );
  }
}
