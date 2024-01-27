import 'package:flutter/material.dart';

class Buffalobreed extends StatelessWidget {
  const Buffalobreed({Key? key}) : super(key: key);

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
        title: const Text("Buffalo_Breed"),
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
