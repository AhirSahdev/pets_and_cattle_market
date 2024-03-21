import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/Detail_Form/bull_detail.dart';

class Bull_breed extends StatelessWidget {
  Bull_breed({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> menuItems = [
    {'title':'Gir'},
    {'title':'Kankrej'},
    {'title':'Sahiwal'},
    {'title':'Tharparkal'},
    {'title':'Red Sindhi'},
    {'title':'Rathi'},
    {'title':'Kangayam'},
    {'title':'Jafarabadi'},
    {'title':'Banni'},
    {'title':'Mehsana'},
    {'title':'Bhadawari'},
    {'title':'Murrah'},
    {'title':'Nili Ravi'},
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
                MaterialPageRoute(builder: (context) => Bull_Detail()),
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
