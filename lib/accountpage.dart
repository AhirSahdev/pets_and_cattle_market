import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/inneracountpage/favorite.dart';
import 'package:pets_and_cattle_market/inneracountpage/innerlanguagepage.dart';
import 'package:pets_and_cattle_market/inneracountpage/innerlocationpage.dart';
import 'package:pets_and_cattle_market/inneracountpage/innerprivecy.dart';
import 'package:pets_and_cattle_market/inneracountpage/innerprofilepage.dart';
import 'package:pets_and_cattle_market/inneracountpage/myadds.dart';

class Accountpage extends StatefulWidget {
  const Accountpage({super.key});

  @override
  State<Accountpage> createState() => _AccountpageState();
}

class _AccountpageState extends State<Accountpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Account',
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          Icon(Icons.account_circle_sharp,size: 100,),
          const Padding(
            padding: EdgeInsets.only(top: 1, bottom: 10),
            child: Center(
                child: Text(
              'Sahdev Goyal',
              style: TextStyle(fontSize: 20),
            )),
          ),

          // Buttons and menu items with appropriate navigation and actions
          Card(
            child: ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('My Profile'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const profileEdit()),
                )
              }, // Replace with navigation logic
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.my_library_add),
              title: const Text('My Ads'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyAds()),
                )
              }, // Replace with navigation logic
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Favorite()),
                )
              }, // Replace with navigation logic
            ),
          ),
          // Card(
          //   child: ListTile(
          //     leading: const Icon(Icons.location_on),
          //     title: const Text('Location'),
          //     onTap: () => {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) =>  LocationScreen()),
          //       )
          //     }, // Replace with navigation logic
          //   ),
          // ),
          Card(
            child: ListTile(
              title: const Text('Change language'),
              leading: const Icon(Icons.language),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LanguageSelectionPage()),
                )
              }, // Replace with language change logic
            ),
          ),
          Card(
            child: ListTile(
              title: const Text('Privacy Policy'),
              leading: const Icon(Icons.info),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const privacy()),
                )
              }, // Replace with privacy policy display logic
            ),
          ),
          // Card(
          //   child: ListTile(
          //     leading: const Icon(Icons.share),
          //     title: const Text('Share App'),
          //     onTap: () => {}, // Replace with app sharing logic
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              child: const Text('Log Out',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              onPressed: () => {}, // Replace with logout logic
            ),
          ),
        ],
      ),
    );
  }
}
