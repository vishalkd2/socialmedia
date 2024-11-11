
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/widgets/CustomWidget.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}

class _UserRegistrationState extends State<UserRegistration> {
  final _namController=TextEditingController();
  final _emailController=TextEditingController();
  final _mobileController=TextEditingController();
  final _passwordController=TextEditingController();
  final _confmPasswordController=TextEditingController();
   final _formKey=GlobalKey<FormState>();

   //Firebase Auth instance
  final FirebaseAuth _auth=FirebaseAuth.instance;
  //Firebase  firestore instance
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

   Future<void> _registerUser()async{
     if (!_formKey.currentState!.validate()){
       return;
     }
     String uname=_namController.text.trim();
     String uemail=_emailController.text.trim();
     String umobile=_mobileController.text.trim();
     String ucnfpassword=_confmPasswordController.text.trim();
     try{
       UserCredential userCredential=await _auth.createUserWithEmailAndPassword(
           email: uemail,
           password: ucnfpassword);
       String uid=userCredential.user!.uid;

       await _firestore.collection('users').doc(uid).set({
         'name':uname,
         'email':uemail,
         'mobile':umobile,
         'uid':uid
       });
       _showSuccessDialog();

     }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error:${e.toString()}')));
     }
   }
  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registration Successful'),
          content: Text('You are registered successfully! Go to Login Page.'),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog and navigate to Login page
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/login'); // Assuming you have a /login route
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Registration'),centerTitle: true,),
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset('assets/background/registeruserbackground.jpg',fit: BoxFit.cover,color: Colors.black.withOpacity(0.5),colorBlendMode: BlendMode.darken)),
          CustomWidget.customSizeBox(context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(
                  labelName: 'Name',
                  controller: _namController,
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value==null||value.isEmpty){
                      return "Name field cant be blank.";
                    }if(!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)){
                      return"Please enter a valid name. ";
                    }
                    }),
                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(
                    labelName: "Email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                   validator: (value){
                      if(value==null||value.isEmpty){
                        return "Email field can't be blank.";
                      }if(!value.contains('@')){
                        return "Enter a valid email.";
                      }}),
                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(
                    labelName: "Mobile",
                    controller: _mobileController,
                    keyboardType: TextInputType.number,
                 maxLength: 10,
                validator: (value){
                      if(value==null||value.isEmpty){
                        return "Please enter  mobile number.";}}
                ,),
                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(
                    labelName: "Password",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    obsecureText: true,
                  validator: (value){
                      if(value==null||value.isEmpty){
                        return"Password field can't be blank";}}),
                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(
                    labelName: "Confirm Password",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                  obsecureText: true,
                  controller: _confmPasswordController,
                  validator: (value){
                      if(value==null||value.isEmpty){
                        return "Confirm password  can't be blank";}
                      if(value!=_passwordController){
                        return "Password don't match.";}}
                ),
                CustomWidget.customSizeBox(context),
                CustomWidget.CustomButton(buttonName: "Submit", backgroundColor: Colors.white, fontSize: 20, onPressed: _registerUser)
              ],
            ),
          )
        ],
      ),
    );
  }
}
