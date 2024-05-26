import 'package:flutter/material.dart';
import 'package:sms_sql/content_buttons.dart';

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        side: const BorderSide(color: Color.fromARGB(255, 60, 60, 60)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: null,
      child: const ContentButtons(),
    );
  }
}
