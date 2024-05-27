import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/sms_home.dart';

class Show_data extends StatefulWidget {
  const Show_data({super.key});

  @override
  State<Show_data> createState() {
    return _Show_dataState();
  }
}

class _Show_dataState extends State<Show_data> {
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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Student').snapshots(),
        builder: (context,snapshot) {
          List<Row> stuWidgets=[];
          if (snapshot.hasError) {
            return (Center(child: Text(snapshot.error.toString())));
          }
          if (snapshot.connectionState==ConnectionState.active) {
            final stu_s=snapshot.data?.docs.reversed.toList();
            for(var Student in stu_s!){
              Row(
                children: [
                  Text(Student['stu_id'],),
                  Text(Student['stu_name']),
                  Text(Student['stu_age']),
                  Text(Student['stu_class']),
                  Text(Student['stu_course']),
                ],
              );
            }
            return Expanded(child: ListView(children: stuWidgets,));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }}