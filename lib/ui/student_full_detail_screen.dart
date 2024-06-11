import 'dart:io';

import 'package:codexias_academy/const/color_const.dart';
import 'package:codexias_academy/model/student_moel.dart';
import 'package:codexias_academy/ui/pay_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
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
                        : const AssetImage('assets/images/scooter_2289821.png')
                            as ImageProvider,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 8,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildText(widget.studentModel.name),
                                buildSizedBox(),
                                buildText(widget.studentModel.lastName),
                                buildSizedBox(),
                                buildText(widget.studentModel.fatherName),
                                buildSizedBox(),
                                buildText(widget.studentModel.village),
                                buildSizedBox(),
                                buildText(widget.studentModel.mobileNo),
                                buildSizedBox(),
                                buildText(widget.studentModel.joinDate),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Card(
                    elevation: 8,
                    child: Container(
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
                                    nameText('TotalFees'),
                                    buildSizedBox(),
                                    nameText('PayFees'),
                                    buildSizedBox(),
                                    nameText('PendingFees'),
                                  ],
                                ),
                                Column(
                                  children: [
                                    dotText(),
                                    buildSizedBox(),
                                    dotText(),
                                    buildSizedBox(),
                                    dotText(),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildText(widget.studentModel.totalFees),
                                    buildSizedBox(),
                                    buildText(widget.studentModel.payFees),
                                    buildSizedBox(),
                                    buildText(widget.studentModel.pendingFees),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaYScreen(),
                            ));
                      },
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: ColorConst.buttonColor),
                        child: const Center(
                            child: Text(
                          'Pay Fees',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: ColorConst.buttonColor),
                      child: const Center(
                          child: Text(
                        'Chat',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(height: 4);

  Text nameText(String text) => Text(text);

  Text buildText(String text) => Text(text);

  Widget dotText() => const Text(':');
}
