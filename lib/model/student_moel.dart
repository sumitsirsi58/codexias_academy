import 'dart:io';

class StudentModel {
  String name;
  String lastName;
  String fatherName;
  String village;
  String fees;
  String mobileNo;
  String joinDate;
  String? image;

  StudentModel(
      {required this.name,
      required this.lastName,
      required this.fatherName,
      required this.village,
      required this.fees,
      required this.mobileNo,
      required this.joinDate,
      this.image});

  Map<String, dynamic> toJason() {
    Map<String, dynamic> json = {
      'name': name,
      'lastName': lastName,
      'fatherName': fatherName,
      'village': village,
      'fees': fees,
      'mobileNo': mobileNo,
      'joinDate': joinDate,
      'image': image,
    };
    return json;
  }

  static StudentModel fromJson(Map<String, dynamic> map) {
    return StudentModel(
      name: map['name'],
      lastName: map['lastName'],
      fatherName: map['fatherName'],
      village: map['village'],
      fees: map['fees'],
      mobileNo: map['mobileNo'],
      joinDate: map['joinDate'],
      image: map['image'],
    );
  }
}
