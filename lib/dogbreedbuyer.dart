import 'package:flutter/material.dart';

class Dogbreed extends StatelessWidget {
  const Dogbreed({Key? key}) : super(key: key);

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
        title: const Text("Dog_Breed"),
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
            trailing: const Icon(Icons.navigate_next),
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
