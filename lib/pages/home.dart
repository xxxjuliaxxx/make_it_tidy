import 'package:flutter/material.dart';
import 'package:make_it_tidy/custom_widgets/day_list.dart';
import 'package:make_it_tidy/custom_widgets/todo_grid_view.dart';
import 'package:make_it_tidy/custom_widgets/todo_information_popup.dart';
import 'package:make_it_tidy/data/to_do_list_data.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  final List<List<String>> todoList = [];
}

class _HomePageState extends State<HomePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  List<String> dayDependentTodos = [];

  List<String> todoInformation = [];

  String weekday = '';
  List list = sun;

  void showInSnackBar(String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      value,
      style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Color.fromARGB(255, 88, 183, 215)),
    )));
  }

  void changeWeekday(String newDay) {
    final weekdayNames = {
      "MON": mon,
      "TUE": tue,
      "WED": wed,
      "THU": thu,
      "FRI": fri,
      "SAT": sat,
      "SUN": sun
    };
    setState(() {
      weekday = newDay;
      list = weekdayNames[newDay] as List;
    });

    updateList();
  }

  void updateList() {
    dayDependentTodos.clear();
    for (int i = 0; i < todoInformation.length; i++) {
      if (todoInformation[i].split(",")[0] == weekday) {
        dayDependentTodos.add(todoInformation[i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            HorizontalDayList(
              dayUpdateFunction: changeWeekday,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    boxShadow: [BoxShadow(blurRadius: 10.0)]),
                child: TodoGridView(
                  list: list,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Transform.scale(
        scale: 1.05,
        child: FloatingActionButton(
          onPressed: () {
            final now = DateTime.now();
            final weekdayNames = [
              "MON",
              "TUE",
              "WED",
              "THU",
              "FRI",
              "SAT",
              "SUN"
            ];
            final newTodo = [
              weekdayNames[now.weekday - 1], // add day of the week
              titleController.text,
              descriptionController.text
            ];
            widget.todoList.add(newTodo);

            showDialog(
                context: context,
                builder: (context) {
                  return TodoInformationPopup(
                    titleController: titleController,
                    descriptionController: descriptionController,
                  );
                }).then((value) {
              setState(() {
                if (descriptionController.text == "" ||
                    titleController.text == "") {
                  showInSnackBar("Title or description can't be empty!");
                } else {
                  list.add({
                    "title": titleController.text,
                    "description": descriptionController.text
                  });
                  print(sun);
                  // todoInformation.add(
                  // "$weekday ${titleController.text} ${descriptionController.text}");

                  updateList();
                  titleController.clear();
                  descriptionController.clear();
                }
              });
            });
          },
          elevation: 13,
          highlightElevation: 50,
          splashColor: const Color.fromARGB(235, 249, 51, 133),
          backgroundColor: const Color.fromARGB(255, 115, 202, 238),
          child: const Icon(
            Icons.add_outlined,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
