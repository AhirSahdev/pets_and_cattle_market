import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:pets_and_cattle_market/home.dart';
import 'package:provider/provider.dart';


class profileEdit extends StatefulWidget {
  const profileEdit({Key? key}) : super(key: key);

  @override
  State<profileEdit> createState() => _profileEdit();
}

class _profileEdit extends State<profileEdit> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  File? _image;

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // UserProfileProvider userProfileProvider;
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

              Center(
                child: GestureDetector(
                  onTap: _getImageFromGallery, // Trigger image selection when tapped
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black, // Background color of the circle
                    child: _image == null
                        ? Icon(Icons.add_a_photo, size: 50,color: Colors.white,) // Show add photo icon if no image selected
                        : Container(
                      width: 100, // Double the radius to make the image cover the whole circle
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
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
                        controller: _phoneController,
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
                        onPressed: () => {
                      //     userProfileProvider =
                      // Provider.of<UserProfileProvider>(context, listen: false),
                      // userProfileProvider.updateUserProfile(
                      // firstName: _firstNameController.text,
                      // lastName: _lastNameController.text,
                      // phoneNumber: _phoneController.text,
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(
                        // builder: (context) => HomeScreen(),
                        // ),
                        // )
                      //)
                        } // Replace with logout logic
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
  // void profileUser()async{
  //
  //   var url="http://192.168.43.146:3000/api/";
  //
  //
  //   var urlParser = Uri.parse(url);
  //   Response response = await http.get(
  //       urlParser,
  //       body:bodyy,
  //       headers: {
  //         "Content-Type":"application/json"
  //       }
  //   );
  //   var dataa = jsonDecode(response.body);
  //   print(response);
  // }
}
