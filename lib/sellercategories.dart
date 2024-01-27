import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/goat_detail.dart';
import 'package:pets_and_cattle_market/buffalobreedseller.dart';
import 'package:pets_and_cattle_market/bullbreedseller.dart';
import 'package:pets_and_cattle_market/catbreedseller.dart';
import 'package:pets_and_cattle_market/cowbreedseller.dart';
import 'package:pets_and_cattle_market/dogbreedseller.dart';
import 'package:pets_and_cattle_market/goatbreedseller.dart';
import 'package:pets_and_cattle_market/horsebreedseller.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

class Buyer_Categories extends StatelessWidget {
  const Buyer_Categories({Key? key}) : super(key: key);

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
        automaticallyImplyLeading: false,
        title: const Text('Select The Type'),
        backgroundColor: Colors.blue,
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
                              builder: (context) => const Cowbreed_Seller()),
                        );
                        break;
                      case 'Buffalo':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Buffalobreed_Seller()),
                        );
                        break;
                      case 'Dog':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dogbreed_Seller()),
                        );
                        break;
                      case 'Bull':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Bull_breed()),
                        );
                        break;
                      case 'Cat':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CatBreed_Seller()),
                        );
                        break;
                      case 'Goat':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Goatbreed_Seller()),
                        );
                        break;
                      case 'Horse':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Horsebreed_Seller()),
                        );
                        break;
                      case 'Sheep':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GoatDetailsPage()),
                        );
                        break;
                      case 'Camel':
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GoatDetailsPage()),
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
