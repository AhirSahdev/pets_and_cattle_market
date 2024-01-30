import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/accountpage.dart';

//import 'home.dart';

class profileEdit extends StatefulWidget {
  const profileEdit({Key? key}) : super(key: key);

  @override
  State<profileEdit> createState() => _profileEdit();
}

class _profileEdit extends State<profileEdit> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),

              Container(
                child: Icon(
                  Icons.account_circle_sharp,
                  size: 100,
                ),
              ),
              SizedBox(
                height: 30,
              ), // Add spacing between image and text fields
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 5),
                      child: Row(
                        children: [
                          Icon(
                            Icons.account_box_outlined,
                            size: 30,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              'Personal Information',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'First Name',
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: _lastNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Last Name',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: TextField(
                        controller: _firstNameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 190,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.blue),
                          alignment: AlignmentDirectional.center,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('Save Information',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          ],
                        ),
                        onPressed: () => {}, // Replace with logout logic
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
