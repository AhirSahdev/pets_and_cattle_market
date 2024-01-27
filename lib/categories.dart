import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/cowbreedbuyer.dart';
import 'package:pets_and_cattle_market/buffalobreedbuyer.dart';
import 'package:pets_and_cattle_market/dogbreedbuyer.dart';
import 'package:pets_and_cattle_market/catbreedbuyer.dart';
import 'package:pets_and_cattle_market/goatbreedbuyer.dart';
import 'package:pets_and_cattle_market/horsebreedbuyer.dart';

import 'bullbreedbuyer.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = [
      'Cow',
      'Buffalo',
      'Dog',
      'Bull',
      'Cat',
      'Goat',
      'Horse',
      'Sheep',
      'Camel'
    ];
    var breedImages = {
      'Cow': 'assets/images/cow.jpeg',
      'Buffalo': 'assets/images/jafarabadi.png',
      'Dog': 'assets/images/bendog.png',
      'Bull': 'assets/images/Red-Sindhi-Bull.png',
      'Cat': 'assets/images/bengal.png',
      'Goat': 'assets/images/Ganjam.png',
      'Horse': 'assets/images/Sindhi-removebg-preview.png',
      'Sheep': 'assets/images/sheep-removebg-preview.png',
      'Camel': 'assets/images/camel.png'
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
              trailing: GestureDetector(
                  child: const Icon(Icons.navigate_next),
                  onTap: () {
                    switch (breed) {
                      case 'Cow':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Cowbreed()),
                        );
                        break;
                      case 'Buffalo':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Buffalobreed()),
                        );
                        break;
                      case 'Dog':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dogbreed()),
                        );
                        break;
                      case 'Bull':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bullbreed()),
                        );
                        break;
                      case 'Cat':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CatBreed()),
                        );
                        break;
                      case 'Goat':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Goatbreed()),
                        );
                        break;
                      case 'Horse':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Horsebreed()),
                        );
                        break;
                    }
                  }));
        },
        itemCount: breeds.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 50, thickness: 2);
        },
      ),
    );
  }
}
