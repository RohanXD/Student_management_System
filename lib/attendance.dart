
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'makepdf.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  var ww = 'BCA';
  var options = [
    'BCA',
    'MCA',
  ];
  var _currentItemSelected = "BCA";
  var rool = "1";

  var options1 = [
    'A',
    'B',
  ];
  var _currentItemSelected1 = "A";
  var rool1 = "A";

  var temp = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Student')
        .where(
      'Sec',
      isEqualTo: ww,
    )
        .snapshots();

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => reportt(
                  list: temp,
                  clas: ww,
                ),
              ),
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.send,
          ),
        ),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 29, 29),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Attendance',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              DropdownButton<String>(
                dropdownColor: Colors.grey,
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
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

                    ww = '';
                    ww = _currentItemSelected + _currentItemSelected1;
                  });
                  print(ww);
                },
                value: _currentItemSelected,
              ),
              const SizedBox(
                width: 10,
              ),
              DropdownButton<String>(
                dropdownColor: Colors.grey,
                isDense: true,
                isExpanded: false,
                iconEnabledColor: Colors.white,
                focusColor: Colors.white,
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
              const SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        body:

        StreamBuilder(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.black45,
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      // 1019
                      setState(() {
                        if (temp.contains(
                            snapshot.data!.docChanges[index].doc['Stu_name'])) {
                          temp.remove(
                              snapshot.data!.docChanges[index].doc['Stu_name']);
                        } else {
                          temp.add(
                              snapshot.data!.docChanges[index].doc['Stu_name']);
                        }
                      });
                      print(temp);
                      setState(() {});
                    },
                    child: Card(
                      child: ListTile(
                        title:
                        Text(snapshot.data!.docChanges[index].doc['Stu_name']),
                        trailing: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: temp.contains(snapshot
                                .data!.docChanges[index].doc['Stu_name'])
                                ? const Color.fromARGB(255, 248, 20, 4)
                                : const Color.fromARGB(255, 0, 228, 8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              temp.contains(snapshot
                                  .data!.docChanges[index].doc['Stu_name'])
                                  ? 'Remove'
                                  : 'add',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
