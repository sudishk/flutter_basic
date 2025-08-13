// Flutter ka Cupertino widgets package import (iOS style widgets ke liye, 
// lekin yaha mainly ChangeNotifier ke liye hum Material/Widgets ke saath use kar sakte hain)
import 'package:flutter/cupertino.dart';

// Apne banaye hue Database helper class ka import
import 'package:flutter_basic/db_helper.dart';

// Image pick karne ke liye 'image_picker' package ka import
import 'package:image_picker/image_picker.dart';

// Provider class banai jo ChangeNotifier ke saath use ho rahi hai
// ChangeNotifier: Flutter ka built-in class jo notifyListeners() call karne par UI update karta hai
class ToDoProvider with ChangeNotifier {

  // TextEditingController ka object — name input ko control aur manage karne ke liye
  TextEditingController nameController = TextEditingController();

  // TextEditingController ka object — email input ko control aur manage karne ke liye
  TextEditingController emailController = TextEditingController();

  // Database me insert hone ke baad student ka ID store karne ke liye
  int? studentId;

  // Students ka data store karne ke liye ek list (har student ek Map ke form me hoga)
  List<Map<String, dynamic>> students = [];

  // XFile object jo image ka path/data store karega
  // step-1: ImagePicker ka result store karne ke liye
  XFile? selectedImage;

  // ------------------------------
  // Method: newAdmission
  // ------------------------------
  // Ye method ek naya student ka record database me insert karega
  void newAdmission() async {
    // Ek map create karte hain jo database ke 'students' table ka ek row banega
    var student = {
      "name": nameController.text.toString(),        // Name field ka value
      "email": emailController.text.toString(),      // Email field ka value
      "profile_pic": selectedImage?.path             // step-3: Image ka path (agar selectedImage null nahi hai)
    };

    // Database me insert karna (DbHelper ka static method call)
    // Aur uska returned inserted row ka id ko studentId me store karna
    studentId = await DbHelper.insertStudents(student);

    // notifyListeners(); // Optional: yaha turant UI update karna chahte ho to uncomment kar sakte ho

    // Student list ko refresh karna (database se latest data fetch)
    getStudents();
  }

  // ------------------------------
  // Method: getStudents
  // ------------------------------
  // Ye method database se saare students ka data fetch karega
  Future<void> getStudents() async {
    // Database se students ka list laana
    var studentList = await DbHelper.selectStudents();

    // Agar list null nahi hai to update karna
    if (studentList != null) {
      students.clear();             // Pehle list ko empty karo
      students.addAll(studentList); // Naya data add karo
      notifyListeners();             // UI ko refresh/update karo
    }
  }

  // ------------------------------
  // Method: selectImage
  // ------------------------------
  // Ye method gallery se ek image select karne ke liye
  Future<void> selectImage() async {
    // step-2: ImagePicker ka use karke gallery se image pick karna
    selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

    // notifyListeners: UI me selected image ko turant show karne ke liye
    notifyListeners();
  }
}
