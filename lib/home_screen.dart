import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isChecked = false;
  String selectedGender = "Male";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Checkbox(value: isChecked, onChanged: (value) {
            if(value != null){
              isChecked = value;
              setState(() {});
            }

          },),
          Radio<String>(value: "Male", groupValue: selectedGender, onChanged: (value) {
            selectedGender = value!;
            setState(() {});
          },),
          Radio<String>(value: "Female", groupValue: selectedGender, onChanged: (value) {
            selectedGender = value!;
            setState(() {});
          },),
          Row(
            children: [
              Text("Others"),
              Radio<String>( value: "Others", groupValue: selectedGender, onChanged: (value) {
                selectedGender = value!;
                setState(() {});
              },),
            ],
          ),

          RatingBar.builder(
            minRating: 1,
            initialRating: 4,
            itemCount: 5,
            itemBuilder: (context, index) {
            return Icon(Icons.star, color: Colors.amber,);
          }, onRatingUpdate: (value) {
              print(value);
          },)
        ],
      ),
    );
  }
}
