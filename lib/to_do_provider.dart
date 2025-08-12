import 'package:flutter/cupertino.dart';
import 'package:flutter_basic/db_helper.dart';
import 'package:image_picker/image_picker.dart';
class ToDoProvider with ChangeNotifier{
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  int? studentId;
  List<Map<String, dynamic>> students = [];
  XFile? selectedImage;
  void newAdmission()async{
    var student = {
      "name" : nameController.text.toString(),
      "email": emailController.text.toString()
    };
    studentId =await DbHelper.insertStudents(student);
    // notifyListeners();
    getStudents();
  }

  Future<void> getStudents()async{
    var studentList =await DbHelper.selectStudents();
    if(studentList != null) {
      students.clear();
      students.addAll(studentList);
      notifyListeners();
    }
  }

  Future<void> selectImage()async{
    selectedImage =await ImagePicker().pickImage(source: ImageSource.gallery);
    notifyListeners();
  }
}