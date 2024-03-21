import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/auth_gate.dart';
import 'package:pets_and_cattle_market/profilepage.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';
import 'package:pets_and_cattle_market/verificationpage.dart';

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String selectedLanguage = 'English'; // Initially selected language

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Language'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 5,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text(
                      'Choose your preferred language:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 15),
                    DropdownButtonFormField<String>(
                      value: selectedLanguage,
                      items: <String>['English', 'Gujrati', 'Hindi']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedLanguage = newValue!;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {
                ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                );

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PhoneAuthScreen()));
              },
              child: const Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
