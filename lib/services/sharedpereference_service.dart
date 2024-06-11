import 'dart:convert';
import 'package:codexias_academy/model/student_moel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPeerService {
  static String studentKey = 'studentKey';

  static Future addStudent(StudentModel std) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> json = std.toJason();
    String stdStr = jsonEncode(json);

    List<String> student = sharedPreferences.getStringList(
          studentKey,
        ) ??
        [];
    student.add(stdStr);

    sharedPreferences.setStringList(studentKey, [stdStr]);
    print('Added successfully');
  }

  static Future<List<StudentModel>> getStudents() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String>? jsonList = sharedPreferences.getStringList(studentKey);

    if (jsonList != null) {
      List<StudentModel> studentLists = [];
      for (int i = 0; i < jsonList.length; i++) {
        String jsonStr = jsonList[i];
        Map<String, dynamic> map = jsonDecode(jsonStr);
        studentLists.add(StudentModel.fromJson(map));
      }
      return studentLists;
    }
    return [];
  }
}
