

import 'package:flutter/material.dart';

class CustomWidget{
  static Widget customSizeBox(BuildContext context,{double heightFactor=0.02}){
    return SizedBox(height: MediaQuery.of(context).size.height*heightFactor,);
  }


  static Widget customTextFormField({
    required String labelName,
    required TextInputType keyboardType,
    int? maxLines,
    int? minLines,
    int? maxLength,
    bool obsecureText = false,
    String? Function(String?)? validator,
    Function(String?)? onSaved,
    TextEditingController? controller
  }){
    return Padding(padding: const EdgeInsets.only(bottom: 8.0),
    child: TextFormField(controller:controller,keyboardType: keyboardType,maxLines: maxLines,minLines: minLines,maxLength: maxLength,obscureText: obsecureText,
    decoration: InputDecoration(
      labelText: labelName,border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: Colors.white.withOpacity(0.7),filled: true
    ),
      validator: validator,onSaved: onSaved,
    ),);
  }

  static Widget CustomButton({
    required String buttonName,
    required Color backgroundColor,
    required double fontSize,
    double borderRadius =30.0,
    required VoidCallback onPressed,
}){
    return ElevatedButton(onPressed: onPressed, child: Text(buttonName,style: TextStyle(fontSize: fontSize,color: Colors.blue,fontWeight: FontWeight.bold),));
  }
}