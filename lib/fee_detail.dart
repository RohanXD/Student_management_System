import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/sms_home.dart';

class FeeDetails extends StatefulWidget {
  const FeeDetails({super.key});

  @override
  State<FeeDetails> createState() {
    return _FeeDetailsState();
  }
}

class _FeeDetailsState extends State<FeeDetails> {
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
          title: Text('Fee Details',
              style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        body: Column(mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Text("No Fee Data",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )))
            ]));
  }
}
