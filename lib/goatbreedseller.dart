import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/goat_detail.dart';
import 'package:pets_and_cattle_market/sellercowdetailpage.dart';

class Goatbreed_Seller extends StatelessWidget {
   Goatbreed_Seller({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> menuItems = [
    {'title':'Ganjam'},
    {'title':'Kanni Adu'},
    {'title':'Marwari'},
    {'title':'Sirohi'},
    {'title':'Tellicherry'},
    {'title':'Boer'},
    {'title':'Beetal'},
    {'title':'Jakhrana'},
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
                MaterialPageRoute(builder: (context) => GoatDetailsPage()),
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
