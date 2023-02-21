import 'package:flutter/material.dart';

class HorizontalDayList extends StatefulWidget {
  const HorizontalDayList({Key? key}) : super(key: key);

  @override
  _HorizontalDayListState createState() => _HorizontalDayListState();
}

class _HorizontalDayListState extends State<HorizontalDayList> {
  List<String> weekdays = ["MON", "TUE", "WED", "THU", "FRI", "SAT", "SUN"];

  Color activeCardColor = const Color.fromARGB(235, 230, 111, 160);
  Color inactiveCardColor = const Color.fromARGB(255, 115, 202, 238);

  Color activeTextColor = const Color.fromARGB(255, 255, 255, 255);
  Color inactiveTextColor = const Color.fromARGB(255, 211, 215, 219);

  List<List<Color>> cardColorList = [
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
    [const Color.fromARGB(255, 115, 202, 238), Colors.white],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: weekdays.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (int i = 0; i < cardColorList.length; i++) {
                  cardColorList[i][0] = inactiveCardColor;
                  cardColorList[i][1] = inactiveTextColor;
                }

                cardColorList[index][0] = activeCardColor;
                cardColorList[index][1] = activeTextColor;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5),
              height: 70,
              width: 45.5,
              decoration: BoxDecoration(
                  color: cardColorList[index][0],
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    weekdays[index],
                    style: TextStyle(
                        fontSize: 18,
                        color: cardColorList[index][1],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
