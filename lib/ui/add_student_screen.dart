import 'dart:io';

import 'package:codexias_academy/const/color_const.dart';
import 'package:codexias_academy/model/student_moel.dart';
import 'package:codexias_academy/services/sharedpereference_service.dart';
import 'package:codexias_academy/services/validator_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController villageController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController joinController = TextEditingController();
  GlobalKey<FormState> fromKeys = GlobalKey();

  File? imgFile;

  void takeSnapshot() async {
    final ImagePicker picker = ImagePicker();
    final XFile? img = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
    );
    if (img == null) return;
    setState(() {
      imgFile = File(img.path);
    });
  }

  @override
  void dispose() {
    joinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Stack(
                    children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade200)),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.grey[100],
                      backgroundImage: (imgFile == null)
                          ? const AssetImage('assets/images/personicon.png')
                          : FileImage(imgFile!) as ImageProvider,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 88,
                    child: InkWell(
                      onTap: (){
                        takeSnapshot();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue
                        ),
                        child: Center(child: Icon(Icons.edit,color: Colors.white,size: 20,)),
                      ),
                    ),
                  ),
                ]),
                Form(
                  key: fromKeys,
                  child: TextFormField(
                    validator: ValidatorService,
                    controller: nameController,
                    cursorColor: ColorConst.textFieled,
                    decoration: InputDecoration(
                        label: Text(
                      'Name',
                      style: TextStyle(color: ColorConst.textFiledText),
                    )),
                  ),
                ),
                TextFormField(
                  validator: ValidatorService,
                  controller: lastNameController,
                  cursorColor: ColorConst.textFieled,
                  decoration: InputDecoration(
                      label: Text(
                    'LastName',
                    style: TextStyle(color: ColorConst.textFiledText),
                  )),
                ),
                TextFormField(
                  validator: ValidatorService,
                  controller: fatherNameController,
                  cursorColor: ColorConst.textFieled,
                  decoration: InputDecoration(
                      label: Text(
                    'FatherName',
                    style: TextStyle(color: ColorConst.textFiledText),
                  )),
                ),
                TextFormField(
                  validator: ValidatorService,
                  controller: villageController,
                  cursorColor: ColorConst.textFieled,
                  decoration: InputDecoration(
                      label: Text(
                    'Village',
                    style: TextStyle(color: ColorConst.textFiledText),
                  )),
                ),
                TextFormField(
                  validator: ValidatorService,
                  controller: feesController,
                  keyboardType: TextInputType.number,
                  cursorColor: ColorConst.textFieled,
                  decoration: InputDecoration(
                      label: Text(
                    'Fees',
                    style: TextStyle(color: ColorConst.textFiledText),
                  )),
                ),
                TextFormField(
                  validator: ValidatorService,
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  cursorColor: ColorConst.textFieled,
                  decoration: InputDecoration(
                      label: Text(
                    'MobileNo',
                    style: TextStyle(color: ColorConst.textFiledText),
                  )),
                ),
          TextFormField(
            validator: (value) {
              return null;
            },
            controller: joinController,
            keyboardType: TextInputType.number,
            cursorColor: ColorConst.textFieled,
            decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: () async {
                  DateTime? datePicked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (datePicked != null) {
                    String formattedDate = DateFormat('dd-MM-yyyy').format(datePicked);
                    joinController.text = formattedDate;
                    print('Date Selected: $formattedDate');
                  }
                },
                child: const Icon(Icons.calendar_month),
              ),
              label: Text(
                'JoinDate',
                style: TextStyle(color: ColorConst.textFiledText),
              ),
            ),
          ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (fromKeys.currentState?.validate() ?? false);
                    String name = nameController.text;
                    String lastName = lastNameController.text;
                    String fatherName = fatherNameController.text;
                    String village = villageController.text;
                    String fees = feesController.text;
                    String mobileNo = mobileController.text;
                    String joinDate = joinController.text;
                    String? image = imgFile?.path;
                    StudentModel std = StudentModel(
                        name: name,
                        lastName: lastName,
                        fatherName: fatherName,
                        village: village,
                        fees: fees,
                        mobileNo: mobileNo,
                        joinDate: joinDate,
                      image: image,
                    );
                    Navigator.pop(context);
                    SharedPeerService.addStudent(std);
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: ColorConst.signTextColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                        child: Text(
                      'Add Student',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
