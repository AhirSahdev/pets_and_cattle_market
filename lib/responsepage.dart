import 'package:flutter/material.dart';

class Response extends StatelessWidget {

  var  menuItems = [
    { 'name': 'Patel Rohit',
      'number': 'Mobile No:-9725337330'},
    { 'name': 'Tirthraj Vaghela', 'number': 'Mobile No:-9510440420'},
    { 'name': 'Laxman Rabari', 'number': 'Mobile No:-9794037330'},
    { 'name': 'Mohan Ahir', 'number': 'Mobile No:-9639284670'},
    { 'name': 'Sahdev Goyal', 'number': 'Mobile No:-9593092838'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Response'),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
          children: menuItems.map((value) =>
         Card(
          child: ListTile(
            leading: const Icon(
              Icons.account_circle,
              size: 40,
            ),
            title:  Text(value['name'].toString()),
            subtitle:  Text( value['number'].toString(),),
            trailing: ElevatedButton(
              onPressed: () {},
              child: const Text('Call'),
            ),
          ),
        )
    ).toList()
      ),
    );
  }
}
