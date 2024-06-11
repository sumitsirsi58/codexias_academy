import 'package:codexias_academy/model/student_moel.dart';
import 'package:flutter/material.dart';

class StudentCardWidget extends StatelessWidget {
  const StudentCardWidget({required this.std, super.key});

  final StudentModel std;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        studentRecordRow('Name                      :', std.name),
        studentRecordRow('LastName               :', std.lastName),
        studentRecordRow('FatherName            :', std.fatherName),

      ],
    );
  }
}
Widget studentRecordRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Row(
      children: [
        Text(label),
        SizedBox(
          width: 50,
        ),
        Text(value),
      ],
    ),
  );
}



