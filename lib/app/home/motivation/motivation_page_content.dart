import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MotivationPageContent extends StatelessWidget {
  const MotivationPageContent({
    Key? key,
    required User user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://i.pinimg.com/564x/18/3f/05/183f05dd6d533972f472b28aa3a38e72.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: <Widget>[
          Container(
            height: 150,
            padding: const EdgeInsets.only(top: 51),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  'Make it TIDY',
                  style: GoogleFonts.yesevaOne(
                    color: Colors.white,
                    fontSize: 52,
                  ),
                ),
                Text(
                  'consistency is the key to any goal',
                  style: GoogleFonts.thasadith(
                    color: Colors.white,
                    fontSize: 23,
                  ),
                )
              ],
            ),
          ),
        ]));
      
  }
}
