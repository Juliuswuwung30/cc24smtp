import 'package:flutter/material.dart';

class RegistrationSuccesfull extends StatefulWidget {
  final String username;
  const RegistrationSuccesfull({super.key, required this.username});

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
            Text(
              'Hai ${widget.username}, Welcome to Doyan Belajar',
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