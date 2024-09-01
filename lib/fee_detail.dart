import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:pdf/widgets.dart' as pw;

class FeeDetails extends StatefulWidget {
  const FeeDetails({super.key});

  @override
  State<FeeDetails> createState() {
    return _FeeDetailsState();
  }
}

class _FeeDetailsState extends State<FeeDetails> {
  final TextEditingController _feeController = TextEditingController();
  final int totalFee = 10000;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _studentsStream = FirebaseFirestore.instance
        .collection('Student')
        .snapshots();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 39, 39, 39),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 29, 29, 29),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Manage Fees',
                style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.refresh,color: Colors.white,),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        body: StreamBuilder(
          stream: _studentsStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Something went wrong");
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
                itemBuilder: (context, index) {
                  var student = snapshot.data!.docs[index];
                  return FutureBuilder<DocumentSnapshot>(
                    future: FirebaseFirestore.instance
                        .collection('fee')
                        .doc(student.id)
                        .get(),
                    builder: (context, feeSnapshot) {
                      if (feeSnapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      var feeData = feeSnapshot.data?.data() as Map<String, dynamic>?;
                      var paidAmount = feeData != null ? feeData['fee_amount'] : 0;
                      var dueAmount = feeData != null ? feeData['due_amount'] : totalFee;

                      return SingleChildScrollView(
                        child: InkWell(
                          child: Card(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            child: ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Student ID: ${student['Stu-id']}',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Student Name: ${student['Stu_name']}',
                                      style: const TextStyle(
                                          fontSize: 24, color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Paid Amount: $paidAmount',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Due Amount: $dueAmount',
                                      style: const TextStyle(
                                          fontSize: 15, color: Colors.white)),
                                ],
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.edit, color: Colors.white),
                                    onPressed: () {
                                      _editFee(context, student.id, feeData);
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.print, color: Colors.white),
                                    onPressed: () async {
                                      await _printStudentFeeDetails(student);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  void _editFee(BuildContext context, String studentId, Map<String, dynamic>? feeData) {
    _feeController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Fee'),
          content: TextField(
            controller: _feeController,
            decoration: const InputDecoration(hintText: "Enter new fee amount"),
            keyboardType: TextInputType.number,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                int enteredFee = int.parse(_feeController.text);
                int previousFee = feeData != null ? feeData['fee_amount'] : 0;
                int newFeeAmount = previousFee + enteredFee;
                int dueAmount = totalFee - newFeeAmount;

                if (newFeeAmount > totalFee) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Total fee amount cannot exceed 10,000'),
                    ),
                  );
                } else if (dueAmount < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Due amount cannot be less than 0'),
                    ),
                  );
                } else {
                  await FirebaseFirestore.instance
                      .collection('fee')
                      .doc(studentId)
                      .set({
                    'fee_amount': newFeeAmount,
                    'due_amount': dueAmount,
                  });

                  Navigator.of(context).pop();
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _printStudentFeeDetails(QueryDocumentSnapshot student) async {
    final pdf = pw.Document();
    final feeData = student.data() as Map<String, dynamic>?;
    final paidAmount = feeData != null ? feeData['fee_amount'] : 0;
    final dueAmount = feeData != null ? feeData['due_amount'] : totalFee;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Container(
            padding: const pw.EdgeInsets.all(10),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(),
              borderRadius: pw.BorderRadius.circular(5),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('Student ID: ${student['Stu-id']}',
                    style: const pw.TextStyle(fontSize: 15)),
                pw.SizedBox(height: 5),
                pw.Text('Student Name: ${student['Stu_name']}',
                    style: const pw.TextStyle(fontSize: 24)),
                pw.SizedBox(height: 5),
                pw.Text('Paid Amount: $paidAmount',
                    style: const pw.TextStyle(fontSize: 15)),
                pw.SizedBox(height: 5),
                pw.Text('Due Amount: $dueAmount',
                    style: const pw.TextStyle(fontSize: 15)),
              ],
            ),
          );
        },
      ),
    );

    await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdf.save());
  }
}
