import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/Dog_Cat_Detal.dart';

class CatBreed_Seller extends StatelessWidget {
  const CatBreed_Seller({Key? key}) : super(key: key);

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
        title: const Text("Cat Breed"),
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
