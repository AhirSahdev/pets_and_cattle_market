import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/home.dart';
import 'package:pets_and_cattle_market/inneracountpage/innerprivecy.dart';
import 'package:pets_and_cattle_market/profilepage.dart';
import 'package:pets_and_cattle_market/splacescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:pets_and_cattle_market/underdetailcard.dart';
import 'auth_gate.dart';
import 'firebase_options.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:pets_and_cattle_market/providers/mainProvider.dart';

import 'homepage.dart';
class AppState {


}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAppCheck.instance.activate(
    // You can also use a `ReCaptchaEnterpriseProvider` provider instance as an
    // argument for `webProvider`
    webProvider:
        ReCaptchaEnterpriseProvider('6LfduXMpAAAAANmVghPrEweMZZI9MDkra2wUmj5i'),
  );

  User? user = FirebaseAuth.instance.currentUser;
  String? userId = user?.uid;
  MobileNumberProvider mobileNumberProvider = MobileNumberProvider();
  UserInfoProvider userInfoProvider = UserInfoProvider();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: mobileNumberProvider),
        ChangeNotifierProvider.value(value: userInfoProvider),
        // Add other providers if needed
      ],
      child: const MyApp(),
    ),
  );

  await Hive.initFlutter();

  // await Hive.openBox('favorites');
  // runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return
    // ChangeNotifierProvider(
    //   create: (_) => UserProfileProvider(),
      MaterialApp(
        debugShowCheckedModeBanner: false,
//theme: ThemeData(
        //  colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // useMaterial3: true),
        home:IntroPage(),
      );
    // );
  }
}
