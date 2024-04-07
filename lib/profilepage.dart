import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pets_and_cattle_market/home.dart';
import 'dart:io';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:pets_and_cattle_market/splacescreen.dart';
import 'package:provider/provider.dart';
import 'package:pets_and_cattle_market/providers/mainProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class profilepage extends StatefulWidget {
  const profilepage({Key? key}) : super(key: key);

  @override
  State<profilepage> createState() => _profilepage();
}

class _profilepage extends State<profilepage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  File? _image;
  String? phoneNumber;


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
    phoneNumber = Provider.of<MobileNumberProvider>(context).mobileNumber;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Profile'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 50),

              Center(
                child: GestureDetector(
                  onTap: _getImageFromGallery, // Trigger image selection when tapped
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black87, // Background color of the circle
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
              SizedBox(height: 50,),
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
                onPressed: () async{
                  var sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool(IntroPageState.KEYLOGIN ,true);
                  registerUser();
                  final firstName = _firstNameController.text;
                  final lastName = _lastNameController.text;

                  if (_image == null) {
                    // Show a dialog indicating that an image needs to be selected
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Missing Image"),
                          content: Text("Please select an image."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (firstName.isNotEmpty && lastName.isNotEmpty) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  } else {
                    // Show a dialog indicating that both first name and last name are mandatory
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Missing Information"),
                          content: Text("Please fill in both first name and last name."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Close the dialog
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Next'),
              )

            ],
          ),
        ),
      ),
    );
  }

  void registerUser()async{

    var url="http://192.168.122.146:3000/api/getuser";
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(
      http.MultipartFile(
        'profilepic', // Field name in the form data
        _image!.readAsBytes().asStream(), // Byte stream of the image file
        _image!.lengthSync(), // Length of the image file
        filename: _image!.path.split('/').last, // Filename of the image file
      ),
    );
    request.fields['name'] = _firstNameController.text;
    request.fields['lastname'] = _lastNameController.text;
    request.fields['phoneNumber'] = phoneNumber!;
    var response = await request.send();
    print(response);
    // Send the request
    // var response = await request.send();
    // var bodyy = json.encode(data);
    // var urlParser = Uri.parse(url);
    // Response response = await http.post(
    //   urlParser,
    //   body:bodyy,
    //   headers: {
    //     "Content-Type":"application/json"
    //   }
    // );
    // var dataa = jsonDecode(response.body);
  }

}
