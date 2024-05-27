import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_sql/profile.dart';

class Section1 extends StatelessWidget {
  const Section1({super.key});

  @override
  Widget build(context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 70,
          ),
          side: const BorderSide(color: Color.fromARGB(255, 60, 60, 60)),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: const Color.fromARGB(255, 39, 39, 39)),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Profile()));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
              ClipOval(
                child: Image.asset(
                  'assets/sms_image_admin.png',
                  height: 75,
                  width: 75,
                  fit: BoxFit.cover,
                ),
              ),
          const VerticalDivider(color: Colors.white, thickness: 2,width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              repText("Emp_ID: Emp_20240101"),
              repText("Name: Professor X"),
              repText("Designation: Coordinator"),
              repText("Branch: BCA"),
            ],
          ),
        ],
      ),
    );
  }

  Widget repText(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
          color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
    );
  }
}
