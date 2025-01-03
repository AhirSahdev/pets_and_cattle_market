import 'package:flutter/material.dart';
import 'package:pets_and_cattle_market/underdetailcard.dart';

class Detail_Card extends StatelessWidget {

  var arrData = [
    {
      'Price':'60,000',
      'time':'15 Minutes Ago',
      'location':'Rangoli Travels, Jetpur Rd, Opp. Rajwadi Pan Darbar Gadh, Dhoraji, Gujarat 360410',
      'Type':'Cow',
      'breed':'Gir',
      'milk':'14',
      'phase':'Adult',
      'age':'6',
      'lactation':'2',
      'name':'Ajendra Variya'
    },
    {'Price':'80,000',
      'time':'45 Minutes Ago',
      'location':'Rangoli Travels, Dhoraji, Gujarat 360410',
      'Type':'Cow',
      'breed':'Kakrej',
      'milk':'12',
      'phase':'Adult',
      'age':'7',
      'lactation':'1',
      'name':'Mohan Dhila'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Container(
        child: ListView(
            children:arrData.map((value) {
              return Card(

                child: InkWell(
                  // onTap: (){
                  //   Navigator.push(context, MaterialPageRoute(builder: (context) =>  UnderCard(value)));
                  // },
                  child: Padding(
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
                              padding: EdgeInsets.only(top: 10, left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        value['Price'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                      SizedBox(width: 80,),
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
                                        Icon(Icons.access_time,size: 20),
                                        Text(value['time'].toString(),style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on_sharp,size: 20,color: Colors.red,
                                        ),
                                        Expanded(child: Text(
                                          value['location'].toString(),
                                          style: TextStyle(fontWeight: FontWeight.w400,fontSize: 15,color: Colors.red,),),
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
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                            ),
                          ),
                          // SizedBox(), // Add some space between containers
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
                                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                                        ),
                                        width: 130,height: 150,
                                        child: Image.asset('assets/images/cowgir.jpg',width:175,fit: BoxFit.cover,),

                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    SizedBox(height: 30),
                                    Container(width: 180,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text('Animal Type',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0,left: 40,),
                                              child: Text('Breed',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(width: 180,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text(value['Type'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0,left:78),
                                              child: Text(value['breed'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            ),
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 10),
                                    Container(width: 180,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text('Milk Per Day',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0,left: 40,),
                                              child: Text('Phase',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(width: 180,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text(value['milk'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0,left:90),
                                              child: Text(value['phase'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            ),
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 10),
                                    Container(width: 180,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text('Age',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0,left: 90,),
                                              child: Text('Lactation',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 13),),
                                            ),
                                          ],
                                        )
                                    ),
                                    Container(width: 180,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0),
                                              child: Text(value['age'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0,left:103),
                                              child: Text(value['lactation'].toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            height: 200,
                            width: 400,
                            decoration: BoxDecoration(
                              border: Border.all(width: 0),
                              borderRadius: const BorderRadius.all(Radius.circular(0)),
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
                                        child: Icon(Icons.account_circle,size: 50),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(value['name'].toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 70,top: 5),
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
                ),
              );
            }).toList()


        ),
      ),
    );
  }
}