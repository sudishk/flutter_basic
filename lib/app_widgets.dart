import 'package:flutter/material.dart';

Widget customTextField(TextEditingController con, String hint, IconData icon,){
  return Row(
    children: [
      Icon(icon),
      Expanded(child: TextField(controller: con, decoration: InputDecoration(hintText: hint, border: OutlineInputBorder(borderRadius: BorderRadius.circular(30))),),
      )
    ],
  );
}
Widget customeBtton(void Function()? function,  String title ){
  return  ElevatedButton(onPressed:function, style: ElevatedButton.styleFrom(backgroundColor: Colors.red), child: Text(title),);
}

Widget halfTextField(TextEditingController con, String hint, BuildContext context){
  var size = MediaQuery.of(context).size.width/2;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      width: size,
      child: TextField(controller:con ,decoration: InputDecoration(hint: Text(hint),border: OutlineInputBorder()),),),
  );
}