import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/goat_detail.dart';
import 'package:pets_and_cattle_market/buffalobreedseller.dart';
import 'package:pets_and_cattle_market/bullbreedseller.dart';
import 'package:pets_and_cattle_market/catbreedseller.dart';
import 'package:pets_and_cattle_market/cowbreedseller.dart';
import 'package:pets_and_cattle_market/dogbreedseller.dart';
import 'package:pets_and_cattle_market/goatbreedseller.dart';
import 'package:pets_and_cattle_market/horsebreedseller.dart';


class Buyer_Categories extends StatelessWidget {
  Buyer_Categories({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = [
    { 'title': 'Cow', 'page': Cowbreed_Seller()},
    {'title': 'Buffalo', 'page': Buffalobreed_Seller()},
    {'title': 'Dog', 'page': Dogbreed_Seller()},
    {'title': 'Bull', 'page': Bull_breed()},
    {'title': 'Cat', 'page': CatBreed_Seller()},
    {'title': 'Goat', 'page': Goatbreed_Seller()},
    {'title': 'Horse', 'page': Horsebreed_Seller()},
    {'title': 'Sheep', 'page': GoatDetailsPage()},
    {'title': 'Camel',  'page': GoatDetailsPage()},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Categories'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (menuItems[index]['page'] != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => menuItems[index]['page']),
                );
              } else {
                // Handle other menu items' actions here
              }
            },
            child: Card(
              child: ListTile(

                trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.black,),
                title: Text(menuItems[index]['title'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ),
            ),
          );
        },
      ),

    );
  }
}
