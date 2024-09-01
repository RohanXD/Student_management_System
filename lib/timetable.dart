import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/sms_home.dart';

class TimeTable extends StatefulWidget {
  const TimeTable({super.key});

  @override
  State<TimeTable> createState() {
    return _TimeTableState();
  }
}

class _TimeTableState extends State<TimeTable> {
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
          title: Text('Time-Table',
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
              children: [
                const SizedBox(width: 20,),
                const Text(
                  'BCA',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 30, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Optional: make the text bold
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color:Color.fromARGB(255, 39, 39, 39)), // Border color
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Rectangle border
                    ),
                  ),
                  child: Image.asset('assets/BCAT.jpg'),
                ),
              ],
            ),
            const SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start (left)
              children: [
                const SizedBox(width: 20,),
                const Text(
                  'MCA',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 30, // Adjust the font size as needed
                    fontWeight: FontWeight.bold, // Optional: make the text bold
                  ),
                ),
                OutlinedButton(
                  onPressed: null,
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color:Color.fromARGB(255, 39, 39, 39)), // Border color
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Rectangle border
                    ),
                  ),
                  child: Image.asset('assets/MCAT.jpg'),
                ),
              ],
            ),
          ],
        )

    );
  }
}
