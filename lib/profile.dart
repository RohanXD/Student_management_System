import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:sms_sql/sms_home.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() {
    return _ProfileState();
  }
}

class _ProfileState extends State<Profile> {
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
        title: Text('Profile',
            style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero, // Remove padding
          side: const BorderSide(color: Color.fromARGB(255, 60, 60, 60)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        ),
        onPressed: null,
        child: SizedBox.expand( // Make the button cover the whole screen
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Image.asset(
                  'assets/prof.jpg',
                  height: 300,
                  width: 300,
                ),
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  repText("Emp_ID: Emp_20240101"),
                  const SizedBox(height: 20),
                  repText("Name: Professor X"),
                  const SizedBox(height: 20),
                  repText("Designation: Coordinator"),
                  const SizedBox(height: 20),
                  repText("Branch: MCA and BCA"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget repText(String text) {
  return Text(
    text,
    style: GoogleFonts.roboto(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.white), // Add underline
  );
}
