import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

// ignore: camel_case_types
class Buffalobreed_Seller extends StatelessWidget {
  const Buffalobreed_Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = [
      'Jafarabadi',
      'Banni',
      'Mehsana',
      'Bhadawari',
      'Surti',
      'Nagpuri',
      'Nili Ravi'
    ];
    var breedImages = {
      'Jafarabadi': 'assets/images/jafarabadi.png',
      'Banni': 'assets/images/Banni-10007.png',
      'Mehsana': 'assets/images/mehsana.png',
      'Bhadawari': 'assets/images/bhadawari.png',
      'Surti': 'assets/images/banni.png',
      'Nagpuri': 'assets/images/nagpuri.png',
      'Nili Ravi': 'assets/images/nili ravi.png'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buffalo Breed"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var breed = breeds[index];
          var breedImagePath = breedImages[breed];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(breedImagePath!),
            ),
            title: Text(breed),
            trailing: IconButton(
              icon: const Icon(
                Icons.navigate_next,
              ),
              onPressed: () {
                // Handle the button press (e.g., navigate to a details screen)
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CowDetailsPage()),
                );
              },
            ),
          );
        },
        itemCount: breeds.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 50, thickness: 2);
        },
      ),
    );
  }
}
