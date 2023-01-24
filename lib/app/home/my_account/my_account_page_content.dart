import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
          Text(
            'You are logged in as $email',
          ),
          const SizedBox(height: 20),
          Stack(
            children: <Widget>[
              SizedBox(
                width: 230.0,
                height: 230.0,
                child: Image.network(
                  'https://i.pinimg.com/564x/77/9a/bb/779abb4a08caa52ac49be4e70df8de28.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const Positioned(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
                child: Text(
                  'Opis zdjęcia',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 172, 158, 177),
              ),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('Log out'),
            ),
          )
        ],
      ),
    );
  }
}
