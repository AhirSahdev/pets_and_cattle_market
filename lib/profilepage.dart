import 'package:flutter/material.dart';

//import 'home.dart';
import 'locationpage.dart';

class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepage();
}

class _profilepage extends State<profilepage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Name'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 50),

            const SizedBox(
              height: 150,
              child: Icon(
                Icons.account_circle_rounded,
                size: 100,
              ),
            ), // Add spacing between image and text fields
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'First Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: 'Last Name',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                final firstName = _firstNameController.text;
                final lastName = _lastNameController.text;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationPage(),
                  ),
                );
              },
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
