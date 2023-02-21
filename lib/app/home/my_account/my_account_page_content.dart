import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountPageContent extends StatelessWidget {
  const MyAccountPageContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Stack(
            children: <Widget>[
              SizedBox(
                width: 230.0,
                height: 230.0,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 100),
                  child: Image.network(
                    'https://i.pinimg.com/564x/77/9a/bb/779abb4a08caa52ac49be4e70df8de28.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Text(
                  'Opis zdjęcia',
                  style: TextStyle(
                    fontSize: 5.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 87),
            child: Text(
              'You are logged in as $email',
              textAlign: TextAlign.center,
              style: GoogleFonts.thasadith(
                fontSize: 19.5,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 102, 182, 216),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Log out'),
            ),
          ),
        ],
      ),
    );
  }
}
