import 'package:flutter/material.dart';
import 'package:make_it_tidy/custom_widgets/day_list.dart';
import 'package:make_it_tidy/custom_widgets/task_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String weekday = "MON";

  void changeWeekday(String newDay) {
    setState(() {
      weekday = newDay;
    });
    print("changed, $weekday");
  }

  List<List<String>> taskInformation = [
    ["Hello", "Hello"]
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const HorizontalDayList(),
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
              child: TaskGridView(taskList: taskInformation),
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.scale(
        scale: 1.05,
        child: FloatingActionButton(
          onPressed: () {},
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
