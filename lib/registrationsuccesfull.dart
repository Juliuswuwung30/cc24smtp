import 'package:flutter/material.dart';

class RegistrationSuccesfull extends StatefulWidget {
  final String username;
  final String fullusername;
  final String nim;
  const RegistrationSuccesfull({
    super.key, 
    required this.username, 
    required this.fullusername,
    required this.nim
    });
    
      @override
      State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RegistrationSuccesfullState();
      }

}

class _RegistrationSuccesfullState extends State<RegistrationSuccesfull> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration Successful'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 120,
            ),
            const SizedBox(height: 30),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _buildInfoRow('Username', widget.username),
                    const Divider(),
                    _buildInfoRow('Full Name', widget.fullusername),
                    const Divider(),
                    _buildInfoRow('NIM', widget.nim),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text('Back to Home'),
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
  State<RegistrationSuccesfull> createState() => _RegistrationSuccesfullState();
}