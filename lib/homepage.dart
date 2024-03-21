// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pets_and_cattle_market/categories.dart';
import 'package:pets_and_cattle_market/underdetailcard.dart';
import "package:http/http.dart" as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:pets_and_cattle_market/providers/mainProvider.dart';

class HomeScreenn extends StatefulWidget {
  final String? userId;
  HomeScreenn({Key? key, this.userId}) : super(key: key);

  @override
  _HomeScreennState createState() => _HomeScreennState();
}

class _HomeScreennState extends State<HomeScreenn> {
  int currentPageIndex = 0;
  List<dynamic> data = [];
  var _searchbar;
  SharedPreferences? prefs;


  // String get createdAtString => null;



  @override
  void initState(){
    super.initState();
    fetchData();
    initSharedPreferences();

  }

  void initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
     var userinfo = prefs?.getString('userData');
    Provider.of<UserInfoProvider>(context, listen: false).setUserDetail(userinfo);
  }

  void fetchData() async {
    var url = "http://192.168.255.146:3000/api/userlisting";
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
        fetchedData.forEach((item){
          String createdAtString = item['createdAt'];
          DateTime createdAt = DateTime.parse(createdAtString);
          DateTime currentTime = DateTime.now();
          Duration timeDifference = currentTime.difference(createdAt);
          int daysOld = timeDifference.inDays;
          item['daysOld'] = daysOld;
        });
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



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Pet Cart'),
        backgroundColor: Colors.blue,
        leading: Center(
            child: Image.asset('assets/images/Pet Salling Logo.png')),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Row(
                  children: [
                     SizedBox(
                      width: 300,
                      child: TextField(
                        controller: _searchbar,
                        decoration: InputDecoration(
                          hintText: 'Search for something',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.category_outlined),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Categories(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                width: 400,
                height: 35,
                color: const Color.fromARGB(255, 182, 219, 250),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Fresh Recommendation',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                children: data.map((value) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UnderCard()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 400,
                          width: 400,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0),
                            borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '₹' + value['price'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25),
                                          ),
                                          SizedBox(width: 70,),
                                          Container(width: 120,height: 30,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 0),
                                              child: Center(
                                                child: Container(
                                                  width: 105,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                      color: Color.fromARGB(255, 0, 0, 0),
                                                      borderRadius:
                                                      BorderRadius.circular(30)),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets.only(
                                                            right: 0, left: 5),
                                                        child: Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets.only(
                                                                  left: 5),
                                                              child: Text(
                                                                'Price Change Possible',
                                                                style: TextStyle(
                                                                    fontSize: 8,
                                                                    color: Colors.white),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 0,bottom: 5),
                                            child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,size: 30,),color: Colors.red,),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Row(
                                          children: [
                                            Icon(Icons.access_time, size: 20),
                                            Text(
                                                value['daysOld'].toString() + ' days old',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 8),
                                        child: Row(
                                          children: [
                                            Icon(Icons.location_on_sharp,
                                                size: 20, color: Colors.red),
                                            Expanded(
                                              child: Text(
                                                value['location'].toString(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                height: 150,
                                width: 400,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0),
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 1),
                                              borderRadius:
                                              const BorderRadius.all(
                                                  Radius.circular(5)),
                                            ),
                                            width: 130,
                                            height: 150,
                                            child: Image.asset(
                                              'assets/images/cowgir.jpg',
                                              width: 175,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(height: 30),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0),
                                                  child: Text(
                                                    'Animal Type',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0, left: 40),
                                                  child: Text(
                                                    'Breed',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0),
                                                  child: Text(
                                                    value['main_categorie'].toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0, left: 78),
                                                  child: Text(
                                                    value['sub_categorie'].toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(height: 10),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0),
                                                  child: Text(
                                                    'Milk Per Day',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0, left: 40),
                                                  child: Text(
                                                    'Phase',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0),
                                                  child: Text(
                                                    value['milk_per_day'].toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0, left: 100),
                                                  child: Text(
                                                    value['phase'].toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        SizedBox(height: 10),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0),
                                                  child: Text(
                                                    'Age',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0, left: 90),
                                                  child: Text(
                                                    'Lactation',
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.w400,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Container(
                                            width: 180,
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0),
                                                  child: Text(
                                                    value['age'].toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 0, left: 103),
                                                  child: Text(
                                                    value['lactation']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                height: 200,
                                width: 400,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 0),
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(0)),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 3),
                                          child: Container(
                                            child: Icon(Icons.account_circle,
                                                size: 50),
                                          ),
                                        ),
                                        Container(width: 210,height: 25,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5),
                                            child: Text(
                                              value['name'].toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 5),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                            ),
                                            child: const Text(
                                              'Call',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                height: 45,
                                width: 400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
  void searchbarUser()async{
    var url="http://192.168.255.146:3000/api/getAllSearch";
    var data={
      "query":_searchbar.text,
    };
    var bodyy = json.encode(data);
    var urlParser = Uri.parse(url);
    Response response = await http.post(
        urlParser,
        body:bodyy,
        headers: {
          "Content-Type":"application/json"
        }
    );
    var dataa = jsonDecode(response.body);
    print(response);
  }
}
