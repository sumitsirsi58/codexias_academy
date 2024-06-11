import 'package:codexias_academy/const/color_const.dart';
import 'package:codexias_academy/services/sharedpereference_service.dart';
import 'package:codexias_academy/ui/add_student_screen.dart';
import 'package:codexias_academy/ui/student_full_detail_screen.dart';
import 'package:codexias_academy/widget/student_card_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.notifications),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SafeArea(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStudentScreen(),
                        ));
                  },
                  child: const ListTile(
                    leading: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.black54,
                    ),
                    title: Text(
                      'Add Student',
                      style: TextStyle(color: Colors.black54, fontSize: 20),
                    ),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.note,
                    size: 30,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'Notes',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.settings,
                    size: 30,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'Setting',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.privacy_tip_sharp,
                    size: 30,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'Privacy',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
                const Divider(
                  color: Colors.grey,
                ),
                const ListTile(
                  leading: Icon(
                    Icons.help_outline,
                    size: 30,
                    color: Colors.black54,
                  ),
                  title: Text(
                    'Help',
                    style: TextStyle(color: Colors.black54, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddStudentScreen(),
              ));
          ;
        },
        backgroundColor: ColorConst.floatingButton,
        child: const Icon(
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
                  Container(
                    height: 48,
                    child: TextField(
                      cursorColor: Colors.grey,
                      cursorHeight: 20,
                      decoration: InputDecoration(
                          label: const Text(
                            'Search.....',
                            style: TextStyle(color: Colors.grey),
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.grey.shade100,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.grey.shade200,
                              ))),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                StudentFullScreen(studentModel: std),
                          ));
                    },
                    child: Card(
                      elevation: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(14)),
                        child: StudentCardWidget(std: std),
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
