import 'package:flutter/material.dart';
import 'package:make_it_tidy/custom_widgets/task_name.dart';

class TaskGridView extends StatefulWidget {
  List<List<String>> taskList;
  TaskGridView({Key? key, required this.taskList}) : super(key: key);

  @override
  _TaskGridViewState createState() => _TaskGridViewState();
}

class _TaskGridViewState extends State<TaskGridView> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: widget.taskList.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskName(title: widget.taskList[index][0], description: widget.taskList[index][1]);
      },
    );
  }
}