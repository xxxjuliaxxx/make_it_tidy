import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var errorMessage = '';
  var isCreatingAccount = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(isCreatingAccount == true
                  ? 'First, register'
                  : 'Try, sign in'),
              const SizedBox(height: 15),
              TextField(
                controller: widget.emailController,
                decoration: const InputDecoration(hintText: 'E-mail:'),
              ),
              TextField(
                controller: widget.passwordController,
                decoration: const InputDecoration(hintText: 'Password:'),
                obscureText: true,
              ),
              Text(errorMessage),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (isCreatingAccount == true) {
                    //registration

                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: widget.emailController.text,
                              password: widget.passwordController.text);
                    } catch (error) {
                      setState(() {
                        const SizedBox(height: 20);
                        errorMessage = error.toString();
                      });
                    }
                  } else {
                    //login

                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: widget.emailController.text,
                          password: widget.passwordController.text);
                    } catch (error) {
                      setState(() {
                        const SizedBox(height: 20);
                        errorMessage = error.toString();
                      });
                    }
                  }
                },
                child: Text(isCreatingAccount == true ? 'Register' : 'Sign in'),
              ),
              const SizedBox(height: 20),
              if (isCreatingAccount == false) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = true;
                    });
                  },
                  child: const Text('Create account'),
                ),
              ],
              if (isCreatingAccount == true) ...[
                TextButton(
                  onPressed: () {
                    setState(() {
                      isCreatingAccount = false;
                    });
                  },
                  child: const Text('Do you already have an account? '),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
