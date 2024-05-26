import 'package:flutter/material.dart';
import 'package:sms_sql/notify.dart';
import 'package:sms_sql/profile.dart';
import 'package:sms_sql/sms_home.dart';
class Section4 extends StatefulWidget{
  const Section4({super.key});

  @override
  State<Section4> createState() => _Section4State();
}

class _Section4State extends State<Section4> {
  int index=1;
  final List <Widget>screens=[
    const Profile(),
    const Smshome(),
    const Notify(),
  ];
  @override
  Widget build (context) {

    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      currentIndex: index,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      items: const [
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person_2_outlined),
        ),
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home_outlined),
        ),
        BottomNavigationBarItem(
          label: "Notifications",
          icon: Icon(Icons.notifications_none),
        ),
      ],
      onTap: (int indexofitem) {
        setState(() {
          index=indexofitem;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screens[indexofitem]),
          ).then((_) => setState(() {}));
        });
      },
      selectedIconTheme: const IconThemeData(size: 30.0),
    );
  }
}