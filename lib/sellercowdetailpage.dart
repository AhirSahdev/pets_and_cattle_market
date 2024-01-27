// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class CowDetailsPage extends StatefulWidget {
  const CowDetailsPage({Key? key}) : super(key: key);

  @override
  State<CowDetailsPage> createState() => _CowDetailsPageState();
}

class _CowDetailsPageState extends State<CowDetailsPage> {
  String _selectedStage = 'Calf';
  String _selectedMonthOrYear = 'Month';
  int fetal_status = 0;
  int milking_status = 0;

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

  bool _isPriceChangePossible = false;
  bool _isVaccinationGiven = false;

  get myController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Selling Details'),
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
                  '*Upload Photos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
                //color: Colors.lightBlueAccent,
                height: 150,
                width: 300,
                child: Padding(
                  padding: EdgeInsets.only(top: 25),
                  child: Center(
                    child: Column(
                      children: [
                        Icon(Icons.photo_camera, size: 60),
                        Text(
                          'Take a Photo',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
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
            _selectedStage == 'Adult'
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Fetal Status',
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                              style: TextStyle(fontWeight: FontWeight.bold),
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
              child: _selectedStage == 'Adult'
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
                          // Adjust spacing if needed
                          Padding(
                            padding: const EdgeInsets.only(left: 0, top: 8),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 230, left: 0),
                              child: Center(
                                child: TextField(
                                  controller: myController,
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
                        hint: const Text("Select The"),
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
