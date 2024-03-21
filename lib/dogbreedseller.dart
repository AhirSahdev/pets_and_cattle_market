import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/Dog_Cat_Detal.dart';

class Dogbreed_Seller extends StatelessWidget {
  Dogbreed_Seller({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> menuItems = [
    {'title':'German Shepherd'},
    {'title':'Labrador'},
    {'title':'Golden Retriever'},
    {'title':'Rottweie'},
    {'title':'Husky'},
    {'title':'Chow Chow'},
    {'title':'Doberman'},
    {'title':'Boxer'},
    {'title':'Spitz'},
    {'title':'Beagle'},
    {'title':'Other'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Breed"),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dog_Cat_Detail()),
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
