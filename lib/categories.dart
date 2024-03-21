import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/detailcard.dart';


class Categories extends StatelessWidget {
  Categories({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = [
    {'title': 'Cow'},
    {'title': 'Buffalo'},
    {'title': 'Dog'},
    {'title': 'Bull'},
    {'title': 'Cat'},
    {'title': 'Goat'},
    {'title': 'Horse'},
    {'title': 'Sheep'},
    {'title': 'Camel'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Detail_Card()),
              );
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
