import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/goat_detail.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

class Goatbreed_Seller extends StatelessWidget {
  const Goatbreed_Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = [
      'Ganjam',
      'Kanni Adu',
      'Marwari',
      'Sirohi',
      'Tellicherry',
      'Boer',
      'Beetal',
      'Jakhrana'
    ];
    var breedImages = {
      'Ganjam': 'assets/images/Ganjam.png',
      'Kanni Adu': 'assets/images/kanni aadu.png',
      'Marwari': 'assets/images/marwari.png',
      'Sirohi': 'assets/images/cow.jpeg',
      'Tellicherry': 'assets/images/cow.jpeg',
      'Boer': 'assets/images/cow.jpeg',
      'Beetal': 'assets/images/cow.jpeg',
      'Jakhrana': 'assets/images/cow.jpeg'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Goat Breed"),
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
                      builder: (context) => const GoatDetailsPage()),
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
