import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/section4.dart';
import 'package:sms_sql/sms_home.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() {
    return _NotifyState();
  }
}

class _NotifyState extends State<Notify> {
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
          title: Text('Notification',
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
                  child: Text("No Notification ",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )))
            ]),
        bottomNavigationBar: const Section4(),);
  }
}
