import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:make_it_tidy/app/home/motivation/motivation_page_content.dart';
import 'package:make_it_tidy/app/home/my_account/my_account_page_content.dart';
import 'package:make_it_tidy/pages/home.dart';

class GoalPage extends StatefulWidget {
  const GoalPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<GoalPage> createState() => _GoalPageState();
}

class _GoalPageState extends State<GoalPage> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: currentIndex == 0
            ? const Size.fromHeight(0)
            : const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Color.fromARGB(255, 251, 100, 127),
                  Color.fromARGB(255, 61, 204, 240)
                ],
              ),
            ),
          ),
          title: Builder(
            builder: (context) {
              if (currentIndex == 1) {
                return const Center(
                  child: Text(
                    'Your goal list',
                    style: TextStyle(fontSize: 20),
                  ),
                );
              }
              return const Center(
                child: Column(children: []),
              );
            },
          ),
        ),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return MotivationPageContent(user: widget.user);
        }
        if (currentIndex == 1) {
          return HomePage();
        }
        return MyAccountPageContent(email: widget.user.email);
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (newIndex) {
          setState(() {
            currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_awesome_outlined),
            label: 'Motivation',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_task_outlined),
            label: 'Add your task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'My account',
          ),
        ],
      ),
    );
  }
}
