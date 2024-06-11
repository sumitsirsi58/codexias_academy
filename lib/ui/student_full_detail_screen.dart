import 'dart:io';

import 'package:codexias_academy/model/student_moel.dart';
import 'package:flutter/material.dart';

class StudentFullScreen extends StatefulWidget {
  const StudentFullScreen({required this.studentModel, super.key});

  final StudentModel studentModel;

  @override
  State<StudentFullScreen> createState() => _StudentFullScreenState();
}

class _StudentFullScreenState extends State<StudentFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200)),
                child: CircleAvatar(
                  radius: 32,
                  backgroundImage: widget.studentModel.image != null
                      ? FileImage(File(widget.studentModel.image!))
                      : const AssetImage('assets/images/scooter_2289821.png') as ImageProvider,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 20,
              child: Container(
                //height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.blue.shade50),
                  color: Colors.blue.shade50,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              nameText('Name'),
                              buildSizedBox(),
                              nameText('LastName'),
                              buildSizedBox(),
                              nameText('FatherName'),
                              buildSizedBox(),
                              nameText('Village'),
                              buildSizedBox(),
                              nameText('Fess'),
                              buildSizedBox(),
                              nameText('MobileNo'),
                              buildSizedBox(),
                              nameText('JoinDate'),
                            ],
                          ),
                          Column(
                            children: [
                              dotText(),
                              buildSizedBox(),
                              dotText(),
                              buildSizedBox(),
                              dotText(),
                              buildSizedBox(),
                              dotText(),
                              buildSizedBox(),
                              dotText(),
                              buildSizedBox(),
                              dotText(),
                              buildSizedBox(),
                              dotText(),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildText(widget.studentModel.name),
                              buildSizedBox(),
                              buildText(widget.studentModel.lastName),
                              buildSizedBox(),
                              buildText(widget.studentModel.fatherName),
                              buildSizedBox(),
                              buildText(widget.studentModel.village),
                              buildSizedBox(),
                              buildText(widget.studentModel.fees),
                              buildSizedBox(),
                              buildText(widget.studentModel.mobileNo),
                              buildSizedBox(),
                              buildText(widget.studentModel.joinDate),
                            ],
                          )
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //
                      //
                      //
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //
                      //     Text(':'),
                      //     Text('${widget.studentModel.lastName}'),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //
                      //     Text(':'),
                      //     Text('${widget.studentModel.fatherName}'),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //
                      //     Text(':'),
                      //     Text('${widget.studentModel.village}'),
                      //   ],
                      // ),
                      //
                      // SizedBox(
                      //   height: 4,
                      // ),
                      //
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text(
                      //     'FatherName         :          ${widget.studentModel.fatherName}'),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text(
                      //     'Village                  :           ${widget.studentModel.village}'),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text(
                      //     'Fees                      :          ${widget.studentModel.fees}'),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text(
                      //     'MobileNo             :          ${widget.studentModel.mobileNo}'),
                      // SizedBox(
                      //   height: 4,
                      // ),
                      // Text(
                      //     'JoniDate               :         ${widget.studentModel.joinDate}'),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => SizedBox(height: 4);

  Text nameText(String text) => Text(text);

  Text buildText(String text) => Text(text);

  Widget dotText() => const Text(':');
}
