import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/addinfo.dart';
import 'package:sms_sql/show_info.dart';
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
      body:
      SingleChildScrollView(
        child: Expanded(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Center(
                    child: Text("No Lecture",
                        style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ))),
                const SizedBox(
                  height: 200,
                ),

                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 39, 39, 39)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Show_data()));
                      },
                      child: const Text(
                        "Show Data",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 39, 39, 39)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Addinfo()));
                      },
                      child: const Text(
                        "Add Info",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
