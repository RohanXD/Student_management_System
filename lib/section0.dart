import 'package:flutter/material.dart';

class Section0 extends StatelessWidget {
  const Section0({super.key});

  @override
  Widget build(context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/sms_image_1.jpg', height: 200),
            Image.asset('assets/sms_image_2.jpg', height: 200),
            Image.asset('assets/sms_image_3.jpg', height: 200),
            Image.asset('assets/sms_image_4.jpg', height: 200),
          ])
    );
  }
}
