import 'package:codexias_academy/const/color_const.dart';
import 'package:codexias_academy/services/sharedpereference_service.dart';
import 'package:codexias_academy/ui/add_student_screen.dart';
import 'package:codexias_academy/ui/student_full_detail_screen.dart';
import 'package:codexias_academy/widget/student_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/student_moel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<StudentModel> studentList = [];

  @override
  void initState() {
    fetchStudentDetail();
    super.initState();
  }

  Future<void> fetchStudentDetail() async {
    List<StudentModel> studentLists = await SharedPeerService.getStudents();
    setState(() {
      studentList = studentLists;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddStudentScreen(),
              ));
          ;
        },
        backgroundColor: ColorConst.floatingButton,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: studentList.length,
          itemBuilder: (context, index) {
            StudentModel std = studentList[index];
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentFullScreen(studentModel: std),));
                    },
                    child: Card(
                      elevation: 20,
                      child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(14)
                      ),

                        child:StudentCardWidget(std: std),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
