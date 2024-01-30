import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/profilepage.dart';

class VerificationCodeScreen extends StatefulWidget {
  final String phoneNumber;

  const VerificationCodeScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Code'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter the code sent to ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Verification code',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String enteredCode = _codeController.text;
                // ... (replace with your verification logic)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const profilepage(),
                  ),
                );
              },
              child: const Text('Verify'),
            )
          ],
        ),
      ),
    );
  }
}
