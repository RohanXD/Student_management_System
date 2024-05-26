import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_sql/lecture.dart';

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(context) {
    return OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 149,
          ),
          side: const BorderSide(color: Color.fromARGB(255, 60, 60, 60)),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
      icon: const Icon(
        Icons.person_2_outlined,
        color: Colors.deepOrange,
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Lecture()));
      },
      label: Text("Today's Lecture ",
          style: GoogleFonts.roboto(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
    );
  }
}
