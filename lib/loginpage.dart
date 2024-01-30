import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/verificationpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required String phoneNumber}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Mobile Number'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Please enter your mobile number....',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                prefix: Text('+91 '),
                // Adjust country code as needed
                hintText: 'Enter mobile number',
                contentPadding: EdgeInsets.all(12.0),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String phoneNumber = _phoneNumberController.text;
                // Perform validation and formatting checks on the phone number
                if (phoneNumber.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VerificationCodeScreen(
                        phoneNumber: phoneNumber,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Please enter a valid phone number')),
                  );
                }
              },
              child: const Text('Send Code'),
            )
          ],
        ),
      ),
    );
  }

  bool isValidPhoneNumber(String phoneNumber) {
    RegExp phoneRegex = RegExp(r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/');
    return phoneRegex.hasMatch(phoneNumber);
  }
}
