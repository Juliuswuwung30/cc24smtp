import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _registrationFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _fullusernameController = TextEditingController();
  final _nimController = TextEditingController();


  bool isLoading = false;

  static Future<String> sendEmail(String email, String username, String fullusername, String nim) async {
    String endpoint = '10.0.2.2:8000';
    String nextUrl = '/kirim-email';

    var response = await http.post(
      Uri.http(endpoint, nextUrl),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'username': username,
        'fullusername': fullusername,
        'nim': nim,
      }),
    );

    var job = json.decode(response.body);
    return job['message'];
  }

  static Container loadingBlock() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      color: Colors.black12,
      child: const SpinKitFadingCircle(
        size: 50,
        color: Colors.lightBlue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 116, 191, 226),
        title: const Text(
          'CC Send Mail API',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Form(
            key: _registrationFormKey,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(24),
                width: double.infinity,
                height: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }

                          return !EmailValidator.validate(value)
                              ? 'Please enter a valid email'
                              : null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: _fullusernameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Username',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full username';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _nimController,
                      decoration: const InputDecoration(
                        labelText: 'NIM',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                        return 'Please enter your NIM';
                        }
                        return null;
                      },
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_registrationFormKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });

                            sendEmail(_emailController.text, _usernameController.text, _fullusernameController.text, _nimController.text).then((result) {
                              setState(() {
                                isLoading = false;
                              });
                              debugPrint('Result email: $result');
                            });
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 116, 191, 226),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading) loadingBlock(),
        ],
      ),
    );
  }
}
