// ignore_for_file: avoid_unnecessary_containers
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class Dog_Cat_Detail extends StatefulWidget {
  const Dog_Cat_Detail({Key? key}) : super(key: key);

  @override
  State<Dog_Cat_Detail> createState() => _CowDetailsPageState();
}

class _CowDetailsPageState extends State<Dog_Cat_Detail> {
  String _selectedStage = 'Puppy';
  String _selectedMonthOrYear = 'Month';

  bool _isPriceChangePossible = false;
  bool _isVaccinationGiven = false;

  int gender = 0;

  void change_gender(int? value) {
    setState(() {
      gender = value ?? 0;
    });
  }

  get myController => null;

  final ImagePicker imagePicker = ImagePicker();
  List<XFile> imageFileList = [];

  void selectImages() async {
    List<XFile>? selectedImages = await imagePicker.pickMultiImage(
      maxWidth: 800, // Adjust the maxWidth and maxHeight as needed
      maxHeight: 600,
      imageQuality: 80, // Adjust the image quality as needed
    );

    if (selectedImages != null) {
      // Ensure the total number of images doesn't exceed 4
      if (imageFileList.length + selectedImages.length > 3) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Exceeded Maximum Images"),
              content: Text("You can select a maximum of 3 images."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        // Add selected images to the list
        imageFileList.addAll(selectedImages);
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const Text('Selling Detail'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Upload Photos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Center(
              child: Container(width: 330,height: 200,decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10,left: 5,right: 5),
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: imageFileList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.file(
                                File(imageFileList[index].path),
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: MaterialButton(
                        color: Colors.blue,
                        child: Text('Pick up your images',style: TextStyle(color: Colors.white),),
                        onPressed: () {
                          selectImages();
                        },
                      ),
                    ),
                  ],
                ),

              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 8),
                child: Text(
                  'Phases',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(15)),
                child: DropdownButton<String>(
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 30,
                  isExpanded: true,
                  underline: const SizedBox(),

                  //elevation: 16,
                  style: const TextStyle(color: Colors.black, fontSize: 17),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  value: _selectedStage,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedStage = newValue!;
                    });
                  },
                  items: <String>['Puppy', 'Adult']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gender',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: gender,
                        onChanged: change_gender,
                      ),
                      const Text('Male'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                        value: 2,
                        groupValue: gender,
                        onChanged: change_gender,
                      ),
                      const Text('Female'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 5, left: 8),
                child: Text(
                  'Age',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Center(
                        child: TextField(
                          controller: myController,
                          decoration: const InputDecoration(
                            hintText: '0',
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(15)),
                      child: DropdownButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 30,
                        isExpanded: true,
                        underline: const SizedBox(),

                        //elevation: 16,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 17),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        value: _selectedMonthOrYear,
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedMonthOrYear = newValue!;
                          });
                        },
                        items: <String>['Month', 'Year']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 0, left: 8),
                child: Text(
                  'Price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(right: 230),
                child: Center(
                  child: TextField(
                    controller: myController,
                    decoration: const InputDecoration(
                      hintText: '0',
                      isDense: true,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: _isPriceChangePossible,
                      onChanged: (bool? newBool) {
                        setState(() {
                          _isPriceChangePossible = newBool!;
                        });
                      }),
                  const Text('Price Change Is Possible',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Select Location',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 8),
                child: Text(
                  'Another Detail (Not Mandatory)',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                      value: _isVaccinationGiven,
                      onChanged: (bool? newBool) {
                        setState(() {
                          _isVaccinationGiven = newBool!;
                        });
                      }),
                  const Text('Vaccination Has Been Given ?',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400))
                ],
              ),
            ),
            Container(
              child: const Padding(
                padding: EdgeInsets.only(top: 10, left: 8),
                child: Text(
                  'Note',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(right: 1),
                child: Container(
                  child: TextField(
                    minLines: 1,
                    maxLines: 3,
                    controller: myController,
                    decoration: const InputDecoration(
                      hintText: '',
                      isDense: true,
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 80, bottom: 30),
              child: Divider(
                color: Colors.grey,
                height: 1,
                thickness: 1,
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 170,
                  height: 90,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 19, left: 20, bottom: 30),
                    child: ElevatedButton(
                      child: const Text('Cancel'),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                  width: 170,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 19, left: 15, bottom: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
