import 'package:flutter/material.dart';

class Horsebreed extends StatelessWidget {
  const Horsebreed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = ['Marwari', 'Kathiawari', 'Sindhi'];
    var breedImages = {
      'Marwari': 'assets/images/marwari-removebg.png',
      'Kathiawari': 'assets/images/Kathiawari-removebg-preview.png',
      'Sindhi': 'assets/images/Sindhi-removebg-preview.png'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Horse_Breed"),
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
