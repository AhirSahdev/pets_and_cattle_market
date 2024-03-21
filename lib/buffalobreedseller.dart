import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

// ignore: camel_case_types
class Buffalobreed_Seller extends StatelessWidget {
   Buffalobreed_Seller({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> menuItems = [
    {'title':'Jafarabadi'},
    {'title':'Banni'},
    {'title':'Mehsana'},
    {'title':'Bhadawari'},
    {'title':'Surti'},
    {'title':'Murrah'},
    {'title':'Nagpuri'},
    {'title':'Nili Ravi'},
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
