import 'package:flutter/material.dart';

class CatBreed extends StatelessWidget {
  const CatBreed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = ['Bengal', 'bombay', 'Siamese', 'Burmese', 'Persian'];
    var breedImages = {
      'Bengal': 'assets/images/bengal.png',
      'bombay': 'assets/images/Bombay.png',
      'Siamese': 'assets/images/siamese.png',
      'Burmese': 'assets/images/burmese.png',
      'Persian': 'assets/images/persian.png'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cat_Breed"),
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
