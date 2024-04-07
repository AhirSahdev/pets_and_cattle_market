import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'package:http/http.dart';
import 'dart:convert';


class Response extends StatefulWidget {
  @override
  State<Response> createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  List<dynamic> data = [];

  @override
  void initState(){
    super.initState();
    fetchData();
  }

  void fetchData() async {
    print("From a animallistg");
    var url = "http://192.168.122.146:3000/api/animalListings";
    var urlParser = Uri.parse(url);
    try {
      var response = await http.get(
          urlParser,
          headers: {
            "Content-Type": "application/json"
          }
      );
      if (response.statusCode == 200) {
        List<dynamic> fetchedData = jsonDecode(response.body);
        print(fetchedData);
        setState(() {
          data = fetchedData;
        });
      } else {
        print("Failed to fetch data: ${response.statusCode}");
      }
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

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
