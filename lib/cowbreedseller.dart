import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

class Cowbreed_Seller extends StatelessWidget {
  const Cowbreed_Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = [
      'Gir',
      'Kankrej',
      'Sahiwal',
      'Thaeparkal',
      'Red Shindhi',
      'Rathi',
      'Ongole',
      'Krishna Valley',
      'Khillari',
      'Kangayam',
      'Hariana',
      'Hallikar',
      'Deoni',
      'Bargur',
      'Amritmahal',
      'HF',
      'Jersey'
    ];
    var breedImages = {
      'Gir': 'assets/images/cow.jpeg',
      'Kankrej': 'assets/images/kakrej.png',
      'Sahiwal': 'assets/images/Sahiwal-Cow_600x600.png',
      'Tharparkal': 'assets/images/Tharparkar.png',
      'Red Shindhi': 'assets/images/Red sindhi.png',
      'Rathi': 'assets/images/rathi.png',
      'Ongole': 'assets/images/ongole.png',
      'Krishna Valley': 'assets/images/Krishna Valley.png',
      'Khillari': 'assets/images/khillari.png',
      'Kangayam': 'assets/images/kangayam.png',
      'Hariana': 'assets/images/Hariana.png',
      'Hallikar': 'assets/images/hallikar.png',
      'Deoni': 'assets/images/deoni.png',
      'Bargur': 'assets/images/bargur.png',
      'Amritmahal': 'assets/images/Amritmahal.png',
      'HF': 'assets/images/hf.png',
      'Jersey': 'assets/images/Jersey-cow.png'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cow Breeds"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var breed = breeds[index];
          var breedImagePath = breedImages[breed];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  AssetImage(breedImagePath ?? 'assets/images/Jersey-cow.png'),
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
