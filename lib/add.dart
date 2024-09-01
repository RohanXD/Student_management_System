import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  TextEditingController Stu_name = TextEditingController();
  TextEditingController Sec = TextEditingController();
  TextEditingController Stu_id = TextEditingController();

  CollectionReference ref = FirebaseFirestore.instance.collection('Student');
  var ww = 'BCA';
  var options = ['BCA', 'MCA'];
  var _currentItemSelected = "BCA";
  var rool = "1";

  var options1 = [
    'A',
    'B',
  ];
  var _currentItemSelected1 = "A";
  var rool1 = "A";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Add a student',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/new_student.png', height: 200),
            const SizedBox(
              height: 100,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: const Color.fromARGB(255, 140, 140, 140)),
                child: TextFormField(
                    controller: Stu_name,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.person_add_alt,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 100, 100, 100),
                      labelText: 'Name',
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ))),
            const SizedBox(
              height: 30,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(),
                    color: const Color.fromARGB(255, 140, 140, 140)),
                child: TextFormField(
                    controller: Stu_id,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(5.5),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      prefixIcon: const Icon(
                        Icons.format_list_numbered_rounded,
                        color: Colors.black,
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 100, 100, 100),
                      labelText: 'Roll Number',
                      labelStyle:
                          const TextStyle(color: Colors.white, fontSize: 20),
                    ))),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Course : ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    DropdownButton<String>(
                      dropdownColor: const Color.fromARGB(255, 150, 150, 150),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: const Color.fromARGB(255, 1, 1, 255),
                      focusColor: const Color.fromARGB(255, 0, 17, 251),
                      items: options.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected) {
                        setState(() {
                          _currentItemSelected = newValueSelected!;
                          rool = newValueSelected;

                          ww = ' ';
                          ww = _currentItemSelected + _currentItemSelected1;
                        });
                        print(ww);
                      },
                      value: _currentItemSelected,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 35,
                ),
                Row(
                  children: [
                    const Text(
                      'Sec : ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    DropdownButton<String>(
                      dropdownColor: const Color.fromARGB(255, 140, 140, 140),
                      isDense: true,
                      isExpanded: false,
                      iconEnabledColor: Colors.blue[900],
                      focusColor: Colors.blue[900],
                      items: options1.map((String dropDownStringItem) {
                        return DropdownMenuItem<String>(
                          value: dropDownStringItem,
                          child: Text(
                            dropDownStringItem,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (newValueSelected1) {
                        setState(() {
                          _currentItemSelected1 = newValueSelected1!;
                          rool1 = newValueSelected1;
                          ww = '';
                          ww = _currentItemSelected + _currentItemSelected1;
                        });
                        print(ww);
                      },
                      value: _currentItemSelected1,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 100, 100, 100),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: () {
                ref.add({
                  'Stu_name': Stu_name.text,
                  'Sec': ww,
                  'Stu-id': Stu_id.text,
                }).whenComplete(() {
                  Fluttertoast.showToast(
                    msg: "Student Added",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black45,
                    textColor: Colors.white,
                    fontSize: 16.0,
                  );
                });
              },
              child: const Text(
                'ADD',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
