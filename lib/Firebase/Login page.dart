import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:untitled27/Home%20Page.dart';
import 'package:untitled27/Firebase/Signup%20page.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome Officer!",
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const Text(
                  'Please log into your account.',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 126, 127, 128)),
                ),
                const SizedBox(
                  height: 60,
                ),
                TextField(
                  controller: _user,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 114, 114, 114),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    labelText: 'User Email',
                    filled: true,
                    fillColor: const Color.fromARGB(255, 114, 114, 114),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _pwd,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color.fromARGB(255, 114, 114, 114),
                    labelText: 'Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none),
                  ),
                ),
                const SizedBox(height: 16.0),
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      MainActionButton(
                        text: 'Login',
                        onTap: () async {
                          if (_email.text.isEmpty ||
                              _pwd.text.isEmpty ||
                              _user.text.isEmpty) {
                            // If any of the fields are empty, show an error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all the fields'),
                              ),
                            );
                            return; // Exit the function if any of the fields are empty
                          }
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _email.text,
                              password: _pwd.text,
                            );
                            // Navigate to the homePage if sign-in is successful
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage(
                                          pageName: 'login',
                                        )));
                          } catch (e) {
                            // Handle the exception/error here
                            print(
                                'Login failed: $e'); // You can log the error for debugging purposes
                            // Show a snackbar, dialog, or any other UI to inform the user about the error
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Login failed: $e'),
                                // You can customize the duration, behavior, and other properties of the snackbar
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 16.0),
                      MainActionButton(
                        text: 'Sign Up',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const signUpPage()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainActionButton extends StatelessWidget {
  const MainActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(const Color(0xFF005EA3)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide.none))),
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    );
  }
}
