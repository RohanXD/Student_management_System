import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sms_sql/sms_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Smshome());
}
