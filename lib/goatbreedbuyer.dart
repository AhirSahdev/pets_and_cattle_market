import 'package:flutter/material.dart';

class Goatbreed extends StatelessWidget {
  const Goatbreed({Key? key}) : super(key: key);

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
        title: const Text("Categories"),
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
