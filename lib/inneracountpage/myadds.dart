import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/underdetailcard.dart';

class MyAds extends StatelessWidget {
  const MyAds({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Ads'),
      ),
      body: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const UnderCard()));
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 190,
              width: 400,
              decoration: BoxDecoration(
                border: Border.all(width: 0),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Column(
                children: [
                  // SizedBox(), // Add some space between containers
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                ),
                                width: 115,
                                height: 115,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 5),
                            Container(
                                width: 180,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 0),
                                      child: Text(
                                        '₹ 60,000/-',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                )),
                            SizedBox(height: 5),
                            Column(
                              children: [
                                Container(
                                    width: 180,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 0),
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
                                          padding:
                                              const EdgeInsets.only(top: 0),
                                          child: Text(
                                            'Cow',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, left: 78),
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
                                Center(
                                  child: Container(
                                      width: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.cyan,
                                      ),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              'Price Change Possible',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    height: 140,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          left: 0,
                        ),
                        child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              surfaceTintColor: Colors.blue),
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 1,
                              ),
                              const Text('Edit',
                                  style: TextStyle(color: Colors.black)),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 0,
                          left: 0,
                        ),
                        child: OutlinedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            'Sold Out',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
