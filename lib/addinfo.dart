import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sms_sql/fieldtext.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_sql/students_info.dart';

class Addinfo extends StatefulWidget {
  const Addinfo({super.key});

  @override
  State<Addinfo> createState() {
    return _AddinfoState();
  }
}

class _AddinfoState extends State<Addinfo> {
  final idcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();
  final coursecontroller = TextEditingController();
  final classcontroller = TextEditingController();
  final TextEditingController _controller = TextEditingController();

  void _resetTextField() {
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
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
                MaterialPageRoute(builder: (context) => const Students_info()));
          },
        ),
        title: Text('Student Management System',
            style: GoogleFonts.oswald(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold)),
      ),
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/new_student.png'),
            const SizedBox(
              height: 40,
            ),
            Fieldtext(idcontroller, "   Student_ID"),
            const SizedBox(height: 20,),
            Fieldtext(namecontroller, "   Name"),
            const SizedBox(height: 20,),
            Fieldtext(agecontroller, "   Age"),
            const SizedBox(height: 20,),
            Fieldtext(coursecontroller, "   Course"),
            const SizedBox(height: 20,),
            Fieldtext(classcontroller, "   Class"),
            const SizedBox(
              height: 40,
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 149,
                ),
                side: const BorderSide(color: Colors.blueAccent),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                backgroundColor: const Color.fromARGB(255, 0, 125, 255),
              ),
              onPressed: () {
                CollectionReference collRef =
                FirebaseFirestore.instance.collection('Student');
                collRef.add({
                  'stu_id': idcontroller.text,
                  'stu_name': namecontroller.text,
                  'stu_age': agecontroller.text,
                  'stu_course': coursecontroller.text,
                  'stu_class': classcontroller.text,
                });
                _resetTextField();
              },
              child: Text("Add Info ",
                  style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
