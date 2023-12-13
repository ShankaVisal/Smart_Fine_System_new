import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled27/Home%20Page.dart';
import 'package:untitled27/Firebase/Signup%20page.dart';
import 'package:untitled27/testingpage.dart';
import 'firebase_options.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Text("Login",style: TextStyle(fontSize: 40),),
                TextField(
                  controller: _user,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _email,
                  decoration: const InputDecoration(
                    labelText: 'User Email',
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _pwd,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    if (_email.text.isEmpty || _pwd.text.isEmpty || _user.text.isEmpty) {
                      // If any of the fields are empty, show an error message
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all the fields'),
                        ),
                      );
                      return; // Exit the function if any of the fields are empty
                    }
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _email.text,
                        password: _pwd.text,
                      );
                      // Navigate to the homePage if sign-in is successful
                      Navigator.push(context, MaterialPageRoute(builder: (context) => homePage(name: _user.text, pageName: 'login',)));
                    } catch (e) {
                      // Handle the exception/error here
                      print('Login failed: $e'); // You can log the error for debugging purposes
                      // Show a snackbar, dialog, or any other UI to inform the user about the error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login failed: $e'),
                          // You can customize the duration, behavior, and other properties of the snackbar
                        ),
                      );
                    }
                  },
                  child: const Text('Login'),
                ),

                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> signUpPage()));
                  },
                  child: const Text('Sign Up'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
