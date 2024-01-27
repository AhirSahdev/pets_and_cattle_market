import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/horsedetail.dart';

class Horsebreed_Seller extends StatelessWidget {
  const Horsebreed_Seller({Key? key}) : super(key: key);

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
        title: const Text("Horse Breed"),
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
                      builder: (context) => const HorseDetailsPage()),
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
