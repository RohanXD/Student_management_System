import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_sql/section2.dart';
import 'package:sms_sql/section3.dart';
import 'package:sms_sql/section4.dart';


class Smshome extends StatefulWidget {
  const Smshome({super.key});

  @override
  State<Smshome> createState() => _SmshomeState();
}

class _SmshomeState extends State<Smshome> {

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 19, 19, 19),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {},
            ),
            title: Text('Student Management System',
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
          ),
          backgroundColor: const Color.fromARGB(255, 29, 29, 29),
          body: Column(mainAxisSize: MainAxisSize.max,
              children: [
                Image.asset('assets/sms_image.jpg',),
                const SizedBox(
                  height: 30,
                ),
                const Section2(),
                const SizedBox(
                  height: 30,
                ),
                const Section3(),
              ]),
          bottomNavigationBar: const Section4(),
    ));
  }
}
