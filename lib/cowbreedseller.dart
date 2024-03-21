import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

class Cowbreed_Seller extends StatelessWidget {
  Cowbreed_Seller({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> menuItems = [
  {'title':'Gir'},
  {'title':'Kankrej'},
  {'title':'Sahiwal'},
  {'title':'Thaeparkal'},
  {'title':'Red Shindhi'},
  {'title':'Rathi'},
  {'title':'Ongole'},
  {'title':'Krishna Valley'},
  {'title':'Kangayam'},
  {'title':'Hariana'},
  {'title':'Hallikar'},
  {'title':'Deoni'},
  {'title':'Bargur'},
  {'title':'Amritmahal'},
  {'title':'HF'},
  {'title':'Jersey'},
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
