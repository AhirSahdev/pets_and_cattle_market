import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 400,
          width: 400,
          decoration: BoxDecoration(
            border: Border.all(width: 0),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            '₹ 60,000',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Price Change Possible',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                                backgroundColor: Colors.lightBlueAccent,
                                height: 2,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 80, bottom: 5),
                            child: Icon(
                              Icons.favorite_border,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Icon(Icons.access_time, size: 20),
                            const Text(
                              ' 15 Minutes Ago',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_sharp,
                              size: 20,
                              color: Colors.red,
                            ),
                            const Expanded(
                              child: Text(
                                "Rangoli Travels, Jetpur Rd, Opp. Rajwadi Pan Darbar Gadh, Dhoraji, Gujarat 360410",
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
              // SizedBox(), // Add some space between containers
              Container(
                height: 200,
                width: 400,
                decoration: BoxDecoration(
                  border: Border.all(width: 0),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
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
                                  const BorderRadius.all(Radius.circular(5)),
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
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    'Animal Type',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 40,
                                  ),
                                  child: Text(
                                    'Breed',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
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
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    'Cow',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 78),
                                  child: Text(
                                    'Gir',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
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
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    'Milk Per Day',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 40,
                                  ),
                                  child: Text(
                                    'Phase',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
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
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    '14',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 90),
                                  child: Text(
                                    'Adult',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
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
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    'Age',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 0,
                                    left: 90,
                                  ),
                                  child: Text(
                                    'Lactation',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
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
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Text(
                                    '6',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 103),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
                // Add content for the second container here
              ),
              // SizedBox(), // Add some space between containers
              Container(
                child: Row(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: Container(
                            child: Icon(Icons.account_circle, size: 50),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Ajendra Variya',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 70, top: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            child: const Text(
                              'Call',
                              style: TextStyle(color: Colors.black),
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
    );
  }
}