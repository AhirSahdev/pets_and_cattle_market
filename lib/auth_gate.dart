import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
import 'package:pets_and_cattle_market/profilepage.dart';
import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:pets_and_cattle_market/providers/mainProvider.dart';



class PhoneAuthScreen extends StatefulWidget {
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String _selectedCountryCode = "+91";

  Future<void> verifyPhone() async {

    String phoneNumber = _selectedCountryCode + _phoneNumberController.text.trim();
    // Check if the length of the entered phone number is not 10 digits
    if (phoneNumber.length != _selectedCountryCode.length + 10) {
      // Show an error message and return without proceeding
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Please enter a 10-digit phone number."),
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
      return; // Exit the method without proceeding
    }

    // Proceed with phone number verification
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      // print('Phone number automatically verified: $authResult');
    };

    final PhoneVerificationFailed verificationFailed = (FirebaseAuthException authException) {
      // print('Phone verification failed: ${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int? forceResend]) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CodeVerificationScreen(verificationId: verId),
        ),
      );
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrievalTimeout = (String verId) {
      // print('Auto retrieval timeout. Verification ID: $verId');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: verified,
      verificationFailed: verificationFailed,
      codeSent: smsSent,
      codeAutoRetrievalTimeout: autoRetrievalTimeout,
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Verification'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/phone.png',width: 200,height: 200),
              Text('Phone Verification',style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 10,),
              Text('We need to register your phone before getting started !',style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,),

              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<String>(
                      value: _selectedCountryCode,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCountryCode = newValue!;
                        });
                      },
                      items: <String>[
                        '+1',
                        '+91',
                        '+44',
                        '+61'
                      ] // Example country codes
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          controller: _phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: 'Enter Phone Number',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              Container(margin: EdgeInsets.only(left: 10,right: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:() async{
                      await get_userData();
                      await verifyPhone();
                    },
                    child: Text('Get OTP'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future get_userData() async {
    try{
      var url="http://192.168.122.146:3000/api/finduserusingphonenumber";
      var data = {
        "phoneNumber":_phoneNumberController.text
      };
      var bodyy = json.encode(data);
      var urlParser = Uri.parse(url);
      Response response = await http.post(
          urlParser,
          body:bodyy,
          headers: {
            "Content-Type":"application/json"
          }
      );
      var dataa = jsonDecode(response.body);
      if(dataa.isNotEmpty){
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('userData', json.encode(dataa));
        Provider.of<UserInfoProvider>(context, listen: false).setUserDetail(dataa);
      }else{
        Provider.of<MobileNumberProvider>(context, listen: false).setMobileNumber(_phoneNumberController.text);
        print("User not found");

      }
    }catch(e){
        print(e);
    }
  }
}

class CodeVerificationScreen extends StatefulWidget {
  final String verificationId;

  CodeVerificationScreen({required this.verificationId});

  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  List<TextEditingController> _controllers = [];
  List<FocusNode> _focusNodes = [];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  @override
  void dispose() {
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  void _initializeControllers() {
    for (int i = 0; i < 6; i++) {
      TextEditingController controller = TextEditingController();
      FocusNode focusNode = FocusNode();
      _controllers.add(controller);
      _focusNodes.add(focusNode);
      controller.addListener(() {
        if (controller.text.isNotEmpty && i < 5) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }
  Future<UserCredential?> signInWithPhoneNumber(
      String verificationId,
      String smsCode,
      ) async {
    try {
      // Check if the user is already signed in
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        // Retrieve the user's current authentication provider data
        List<UserInfo> providerData = currentUser.providerData;

        // Extract the provider ID from the first provider in the list
        String providerId =
        providerData.isNotEmpty ? providerData[0].providerId : '';

        // Create a new AuthCredential object based on the provider ID
        AuthCredential credential;
        if (providerId == 'phone') {
          // If the user is already authenticated via phone, create PhoneAuthCredential
          credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
        } else {
          // Handle other authentication providers here if needed
          throw Exception('Unsupported authentication provider: $providerId');
        }

        // Sign in with the credential
        return await FirebaseAuth.instance.signInWithCredential(credential);
      }

      // If the user is not signed in, proceed with phone authentication
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      // Sign in with the credential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      if (e is FormatException) {
        print('Invalid format: $e');
      } else {
        print('Failed to verify phone number: $e');
      }
    }

    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verify'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/phone.png',width: 200,height: 200),
                Text('Phone Verification',style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 10,),
                Text('We need to register your phone without getting started!',style: TextStyle(
                  fontSize: 16,
                ),
                  textAlign: TextAlign.center,),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                        (index) => _buildCodeBox(index),
                  ),
                ),
                SizedBox(height: 50),
                Container(margin: EdgeInsets.only(left: 10,right: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        String smsCode = _controllers.map((controller) => controller.text).join();
                        UserCredential? userCredential = await signInWithPhoneNumber(widget.verificationId, smsCode);
                        if (userCredential != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => profilepage(),
                            ),
                          );
                        } else {
                          // Sign-in failed, show an error message or handle it accordingly
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Error"),
                                content: Text("Failed to verify phone number. Please try again."),
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
                      child: Text('Verify Phone Number'),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCodeBox(int index) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        onChanged: (String value) {
          if (value.isNotEmpty && index < 5) {
            _focusNodes[index + 1].requestFocus();
          }
        },
        decoration: InputDecoration(
          counter: Offstage(), // Hide character counter
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
