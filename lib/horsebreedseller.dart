import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/horsedetail.dart';

class Horsebreed_Seller extends StatelessWidget {
   Horsebreed_Seller({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> menuItems = [
    {'title':'Marwari'},
    {'title':'Kathiawari'},
    {'title':'Sindhi'},
    {'title':'Other'},
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
                MaterialPageRoute(builder: (context) => HorseDetailsPage()),
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
