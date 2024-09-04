import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/sms_home.dart';

class Exam extends StatefulWidget {
  const Exam({super.key});

  @override
  State<Exam> createState() {
    return _ExamState();
  }
}

class _ExamState extends State<Exam> {
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
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const Smshome()));
            },
          ),
          title: Text('Examination',
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Column(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/exam.png')
            ]));
  }
}
