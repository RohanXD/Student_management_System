import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/sms_home.dart';

class Syllabusmca extends StatefulWidget {
  const Syllabusmca({super.key});

  @override
  State<Syllabusmca> createState() {
    return _SyllabusmcaState();
  }
}

class _SyllabusmcaState extends State<Syllabusmca> {
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
          title: Text('Syllabus',
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
          actions: [
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Syllabusmca()));

              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromARGB(255, 19, 19, 19)),
              ),
              child: Text(
                'BCA',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(width: 20,),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Syllabusmca()));

              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromARGB(255, 19, 19, 19)),
              ),
              child: Text(
                'MCA',
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body:SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset('assets/MCA.jpg',)
              ]),
        ));
  }
}
