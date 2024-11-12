import 'package:flutter/material.dart';

class RegistrationSuccesfull extends StatefulWidget {
  const RegistrationSuccesfull({super.key});

  @override
  State<RegistrationSuccesfull> createState() => _RegistrationSuccesfullState();
}

class _RegistrationSuccesfullState extends State<RegistrationSuccesfull> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Successful'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Your registration was successful!',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}