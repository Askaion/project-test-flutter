import 'package:flutter/material.dart';
import 'third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  SecondScreen({required this.name});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String selectedUserName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome'),
            SizedBox(height: 16),
            Text('Name from First Screen: ${widget.name}'),
            SizedBox(height: 16),
            Text('Selected User Name: $selectedUserName'), 
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThirdScreen(),
                  ),
                );

                if (result != null && result is String) {
                  setState(() {
                    selectedUserName = result;
                  });
                }
              },
              child: Text('Choose a User'),
            ),
          ],
        ),
      ),
    );
  }
}
