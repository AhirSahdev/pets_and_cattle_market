import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/Dog_Cat_Detal.dart';

class Dogbreed_Seller extends StatelessWidget {
  const Dogbreed_Seller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = [
      'German Shepherd',
      'Labrador',
      'Golden Retriever',
      'Rottweie',
      'Husky',
      'Chow Chow',
      'Doberman',
      'Boxer',
      'Spitz',
      'Beagle',
    ];
    var breedImages = {
      'German Shepherd': 'assets/images/German.png',
      'Labrador': 'assets/images/labra.png',
      'Golden Retriever': 'assets/images/golden.png',
      'Rottweie': 'assets/images/rotwelar.png',
      'Husky': 'assets/images/Beagle-removebg-preview.png',
      'Chow Chow': 'assets/images/chow chow.png',
      'Doberman': 'assets/images/dober.png',
      'Boxer': 'assets/images/bendog.png',
      'Spitz': 'assets/images/spitz.png',
      'Beagle': 'assets/images/Beagle-removebg-preview.png'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dog Breed"),
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
                      builder: (context) => const Dog_Cat_Detail()),
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
