import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:pets_and_cattle_market/home.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String _selectedCategory = 'Cow';
  String _selectedSubCategory = 'Gir'; // Default subcategory for Cow

  Map<String, List<String>> subCategories = {
    'Cow': ['Gir', 'Kankrej','Sahiwal','Thaeparkal','Red Shindhi','Rathi','Ongole','Krishna Valley','Khillari','Kangayam','Hariana','Hallikar', 'Deoni', 'Bargur','Amritmahal', 'HF','Jersey'],
    'Buffalo': ['Jafarabadi','Banni','Mehsana','Bhadawari','Surti','Murrah','Nagpuri','Nili Ravi','Other'],
    'Bull': ['Gir','Kankrej','Sahiwal','Tharparkal','Red Sindhi','Rathi','Kangayam','Jafarabadi','Banni','Mehsana','Bhadawari','Murrah','Nili Ravi','Other'],
    'Cat': ['Bengal', 'bombay', 'Siamese', 'Burmese', 'Persian'],
    'Dog': ['German Shepherd','Labrador', 'Golden Retriever', 'Rottweie', 'Husky', 'Chow Chow', 'Doberman', 'Boxer', 'Spitz', 'Beagle',],
    'Goat': [ 'Ganjam','Kanni Adu', 'Marwari', 'Sirohi', 'Tellicherry', 'Boer', 'Beetal', 'Jakhrana'],
    'Horse': ['Marwari', 'Kathiawari', 'Sindhi'],
    'Sheep': [],
    'Camel': [],
  };
  String _selectedStage = 'Calf';
  String _selectedMonthOrYear = 'Month';
  int fetal_status = 0;
  int milking_status = 0;
  int gender_status = 0;

  bool _isPriceChangePossible = false;
  bool _isVaccinationGiven = false;


  void change_fetal_status(int? value) {
    setState(() {
      fetal_status = value ?? 0;
    });
  }

  void change_milking_status(int? value) {
    setState(() {
      milking_status = value ?? 0;
    });
  }

  void change_gender_status(int? value) {
    setState(() {
      gender_status = value ?? 0;
    });
  }


  get myController => null;
  get myprice => null;
  get mylactation => null;


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
        title: Text('Category Selection'),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '*Upload Photos',
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
            SizedBox(height: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: const Padding(
                          padding: EdgeInsets.only(top: 10, left: 8),
                          child: Text(
                            'Categories',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),

                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:8.0),
                        padding: EdgeInsets.only(left: 8.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(15)),
                        child: DropdownButton<String>(
                          value: _selectedCategory,
                          iconSize: 30,
                          isExpanded: true,
                          underline: const SizedBox(),
                          items: subCategories.keys.map((String category) {
                            return DropdownMenuItem<String>(
                              value: category,
                              child: Text(category),
                            );
                          }).toList(),
                          onChanged:  (String? newValue) {
                            setState(() {
                              _selectedCategory = newValue!;
                              // Reset subcategory to default when category changes
                              _selectedSubCategory = subCategories[_selectedCategory]!.isNotEmpty
                                  ? subCategories[_selectedCategory]![0]
                                  : '';
                              // Reset radio button values
                              fetal_status = 0;
                              milking_status = 0;
                              gender_status = 0;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),

                if (subCategories[_selectedCategory]!.isNotEmpty) // Conditional rendering of the subcategory dropdown
                  Padding(
                    padding: EdgeInsets.only(left: 8.0), // Left side padding for subcategories dropdown
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: const Padding(
                            padding: EdgeInsets.only(top: 10, left: 8),
                            child: Text(
                              'Breed',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),

                            ),
                          ),
                        ),
                        Container(

                          padding: EdgeInsets.only(left: 16, right: 16),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(15)),
                          child: DropdownButton<String>(
                            value: _selectedSubCategory,
                            iconSize: 30,
                            isExpanded: true,
                            underline: const SizedBox(),
                            items: subCategories[_selectedCategory]!.map((String subCategory) {
                              return DropdownMenuItem<String>(
                                value: subCategory,
                                child: Text(subCategory),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                _selectedSubCategory = newValue!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
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
                  hint: const Text("Select The"),
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
                  items: <String>['Calf', 'Adult']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (_selectedCategory != 'Cow' && _selectedCategory != 'Buffalo' && _selectedCategory != 'Bull') // Only render for categories other than Cow, Buffalo, Bull
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 8),
                    child: Text(
                      'Gender',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (_selectedCategory != 'Cow' && _selectedCategory != 'Buffalo' && _selectedCategory != 'Bull') // Only render for categories other than Cow, Buffalo, Bull
                  Radio(
                    value: 1,
                    groupValue: gender_status,
                    onChanged: change_gender_status,
                  ),
                if (_selectedCategory != 'Cow' && _selectedCategory != 'Buffalo' && _selectedCategory != 'Bull') // Only render for categories other than Cow, Buffalo, Bull
                  const Text('Male'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                if (_selectedCategory != 'Cow' && _selectedCategory != 'Buffalo' && _selectedCategory != 'Bull') // Only render for categories other than Cow, Buffalo, Bull
                  Radio(
                    value: 2,
                    groupValue: gender_status,
                    onChanged: change_gender_status,
                  ),
                if (_selectedCategory != 'Cow' && _selectedCategory != 'Buffalo' && _selectedCategory != 'Bull') // Only render for categories other than Cow, Buffalo, Bull
                  const Text('Female'),
              ],
            ),




            (_selectedStage == 'Adult' && gender_status != 1 && _selectedCategory != 'Bull' && _selectedCategory != 'Dog' && _selectedCategory != 'Cat')
                ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fetal Status',
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: fetal_status,
                            onChanged: change_fetal_status,
                          ),
                          const Text('Pregnant'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Radio(
                            value: 2,
                            groupValue: fetal_status,
                            onChanged: change_fetal_status,
                          ),
                          const Text('Non-Pregnant'),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Milking status',
                        style: TextStyle(fontWeight: FontWeight.w400,fontSize: 18),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: milking_status,
                            onChanged: change_milking_status,
                          ),
                          const Text('Milch'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: milking_status,
                            onChanged: change_milking_status,
                          ),
                          const Text('Dry'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            )
                : Container(),
            (milking_status == 1 && _selectedStage == 'Adult')
                ? Container(
              padding: const EdgeInsets.only(top: 5, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Milking Per Day',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  // Adjust spacing if needed
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 8),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 238, left: 0),
                      child: Center(
                        child: TextField(
                          controller: myController,
                          decoration: const InputDecoration(
                            hintText: '0 ltr',
                            isDense: true,
                            isCollapsed: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10))),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: (_selectedStage == 'Adult' && gender_status != 1 && _selectedCategory != 'Bull' && _selectedCategory != 'Dog' && _selectedCategory != 'Cat')
                  ? Container(
                padding: const EdgeInsets.only(top: 5, left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Lactation',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 8),
                      child: Padding(
                        padding:
                        const EdgeInsets.only(right: 230, left: 0),
                        child: Center(
                          child: TextField(
                            controller: mylactation,
                            decoration: const InputDecoration(
                              hintText: '0',
                              isDense: true,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10))),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  : Container(),
            ),
            (_selectedStage == 'Adult' && fetal_status == 1)
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 0, left: 8),
                    child: Text(
                      'Pregnancy Time',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
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
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
                : Container(),



            (_selectedCategory == 'Horse')
            ?Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: const Padding(
                    padding: EdgeInsets.only(top: 0, left: 8),
                    child: Text(
                      'Height',
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
                    controller: myprice,
                    decoration: const InputDecoration(
                      hintText: '0 inch',
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
              ],
                )
            : Container(),
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
                SizedBox(
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
                    controller: myprice,
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
