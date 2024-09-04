import 'package:flutter/material.dart';
import 'package:sms_sql/add.dart';
import 'package:sms_sql/attendance.dart';
import 'package:sms_sql/custom_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sms_sql/fee_detail.dart';
import 'package:sms_sql/helpandsupport.dart';
import 'package:sms_sql/library.dart';
import 'package:sms_sql/info.dart';
import 'package:sms_sql/result.dart';
import 'package:sms_sql/syllabus.dart';
import 'package:sms_sql/timetable.dart';

class ContentButtons extends StatelessWidget {
  const ContentButtons({super.key});

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.max,

      children: [
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 45,
            ),
            Text(
              'Quick Action',
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Divider(thickness: 2,color: Color.fromARGB(255, 69, 69, 69),),
        const SizedBox(
          height: 20,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: CustomButton(
                        'Student\'s Info',
                        Icons.person,
                        Colors.blueAccent,
                        screen: () => const Info(),
                      )),
                      Expanded(
                          child: CustomButton(
                        'Attendance',
                        Icons.bar_chart,
                        Colors.greenAccent,
                        screen: () => const Attendance(),
                      )),
                      Expanded(
                        child: CustomButton(
                            'Add Info', Icons.person_add_alt_1_outlined, Colors.lightBlueAccent,
                            screen: () => const add()),
                      ),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: CustomButton(
                              'Library', Icons.library_books, Colors.green,
                              screen: () => const Library())),
                      Expanded(
                        child: CustomButton('Fee Details', Icons.currency_rupee,
                            Colors.lightBlue,
                            screen: () => const FeeDetails()),
                      ),
                      Expanded(
                          child: CustomButton(
                              'Examination', Icons.receipt_long_rounded, Colors.cyan,
                              screen: () => const Result())),
                    ]),
                const SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomButton('Time Table', Icons.access_time,
                            Colors.lightGreenAccent,
                            screen: () => const TimeTable()),
                      ),
                      Expanded(
                        child: CustomButton(
                            'Help & Support', Icons.support, Colors.cyanAccent,
                            screen: () => const HelpandSupport()),
                      ),
                      Expanded(
                          child: CustomButton(
                              'Syllabus and \n     Subject', Icons.book_online, Colors.green,
                              screen: () => const Syllabus())),
                    ]),
                const SizedBox(
                  height: 20,
                ),
              ],
            )),
      ],
    );
  }
}
