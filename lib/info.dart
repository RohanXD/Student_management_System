import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  var ww = 'BCA';
  var options = [
    'BCA',
    'MCA',
  ];
  var rool = "1";

  var options1 = [
    'A',
    'B',
  ];
  var rool1 = "A";

  var temp = [];

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('Student')
        .orderBy(
          'Stu-id',
        )
        .snapshots();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 29, 29),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Student\'s Information',
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 15,
              ),
              const SizedBox(
                width: 25,
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("something is wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 3, 3, 3),
              ),
              child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (_, index) {
                  return SingleChildScrollView(
                    child: InkWell(
                      child: Card(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        child: ListTile(
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  snapshot
                                      .data!.docChanges[index].doc['Stu-id'],
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  snapshot
                                      .data!.docChanges[index].doc['Stu_name'],
                                  style: const TextStyle(
                                      fontSize: 24, color: Colors.white)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                  snapshot
                                      .data!.docChanges[index].doc['Sec'],
                                  style: const TextStyle(
                                      fontSize: 15, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
