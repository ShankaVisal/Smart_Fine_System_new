import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled27/Firebase/Login%20page.dart';
import 'package:untitled27/Home%20Page.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _rePwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "SignUp",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
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
                    obscureText: true,
                    controller: _pwd,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 114, 114, 114),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    obscureText: true,
                    controller: _rePwd,
                    decoration: InputDecoration(
                      labelText: 'Re Enter Password',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 114, 114, 114),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  MainActionButton(
                    text: 'Sign Up',
                    onTap: () async {
                      if (_email.text.isEmpty ||
                          _pwd.text.isEmpty ||
                          _rePwd.text.isEmpty ||
                          _user.text.isEmpty) {
                        // If any of the fields are empty, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        );
                        return; // Exit the function if any of the fields are empty
                      }

                      if (_pwd.text != _rePwd.text) {
                        // If the passwords do not match, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return; // Exit the function if the passwords do not match
                      }

                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _pwd.text,
                        );
                        // Navigate to the homePage if sign-up is successful
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => homePage(
                                      name: _user.text,
                                      pageName: 'sinup',
                                    )));
                      } catch (e) {
                        // Handle the exception/error here
                        print(
                            'Sign Up failed: $e'); // You can log the error for debugging purposes
                        // Show a snackbar, dialog, or any other UI to inform the user about the error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign Up failed: $e'),
                            // You can customize the duration, behavior, and other properties of the snackbar
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
