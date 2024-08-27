import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/add.dart';
import 'package:sms_sql/sms_home.dart';

class Students_info extends StatefulWidget {
  const Students_info({super.key});

  @override
  State<Students_info> createState() {
    return _Students_infoState();
  }
}

class _Students_infoState extends State<Students_info> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 19, 19, 19),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Smshome()));
          },
        ),
        title: Text('Student Management System',
            style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Student')
            .orderBy('Stu_id', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final stuList = snapshot.data?.docs.reversed.toList();
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(
                    label: Text('ID', style: TextStyle(color: Colors.white)),
                  ),
                  DataColumn(
                      label: Text(
                    'Name',
                    style: TextStyle(color: Colors.white),
                  )),
                  DataColumn(
                      label: Text(
                    'Course',
                    style: TextStyle(color: Colors.white),
                  )),
                ],
                rows: stuList!.map((student) {
                  final stuData = student.data() as Map<String, dynamic>;
                  return DataRow(cells: [
                    DataCell(Text(
                      stuData['Stu_id'],
                      style: const TextStyle(color: Colors.grey),
                    )),
                    DataCell(Text(
                      stuData['Stu_name'],
                      style: const TextStyle(color: Colors.grey),
                    )),
                    DataCell(Text(
                      stuData['Sec'],
                      style: const TextStyle(color: Colors.grey),
                    )),
                  ]);
                }).toList(),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const add()));
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
