import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/bull_detail.dart';

class Bull_breed extends StatelessWidget {
  const Bull_breed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breeds = [
      'Gir',
      'Kankrej',
      'Sahiwal',
      'Tharparkal',
      'Red Shindhi',
      'Rathi',
      'Kangayam'
          'Jafarabadi',
      'Banni',
      'Mehsana',
      'Bhadawari',
      'Murrah',
      'Nili Ravi'
    ];
    var breedImages = {
      'Gir': 'assets/images/mohan gir bull.png',
      'Kankrej': 'assets/images/kakrej.png',
      'Sahiwal': 'assets/images/sahiwalbull.png',
      'Tharparkal': 'assets/images/tharparkar_bull.png.jpeg',
      'Red Shindhi': 'assets/images/Red-Sindhi-Bull.png',
      'Rathi': 'assets/images/Rathi-bull-1-1024x576.png',
      'Kangayam': 'assets/images/kangayam (1).png',
      'Jafarabadi': 'assets/images/jafarabadi.png',
      'Banni': 'assets/images/Banni-10007.png',
      'Mehsana': 'assets/images/mahsana.png',
      'Bhadawari': 'assets/images/Bhadawari-bull.png',
      'Murrah': 'assets/images/Murrah-10505.png',
      'Nili Ravi': 'assets/images/nili_ravi-removebg-preview.png',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text("Bull Breeds"),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          var breed = breeds[index];
          var breedImagePath = breedImages[breed];

          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage:
                  AssetImage(breedImagePath ?? 'assets/images/bargur.png'),
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
                  MaterialPageRoute(builder: (context) => const Bull_Detail()),
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