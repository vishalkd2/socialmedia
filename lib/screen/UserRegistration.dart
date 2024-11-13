import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/widgets/CustomWidget.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}
class _UserRegistrationState extends State<UserRegistration> {
  final _namController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _registerUser() async {
    // Corrected condition: Proceed if form is valid
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Safely getting text values
    String uname = _namController.text.trim();
    String uemail = _emailController.text.trim();
    String umobile = _mobileController.text.trim();
    String upassword = _passwordController.text.trim();

    try {
      // Firebase Auth - User creation
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: uemail,
        password: upassword,
      );
      // Checking if the user is null
      if (userCredential.user == null) {
        throw Exception("User not created");
      }
      String uid = userCredential.user!.uid;
      // Firestore - Adding user data
      await _firestore.collection('users').doc(uid).set({
        'name': uname,
        'email': uemail,
        'mobile': umobile,
        'password':upassword,
        'uid': uid,
      });

      // Show success dialog
      _showSuccessDialog();
    } catch (e) {
      // Error handling
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
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
                Navigator.pushReplacementNamed(context, '/landingpage'); // Assuming you have a /login route
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
      appBar: AppBar(title: Text('User Registration'), centerTitle: true,backgroundColor: Colors.cyan.withOpacity(0.5),),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background/registeruserbackground.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.5),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: RichText(text:TextSpan(style:TextStyle(fontSize: 36,fontWeight: FontWeight.bold,letterSpacing: 1.2),
                          children: [TextSpan(text: "Start",style: TextStyle(color: Colors.deepOrange)),TextSpan(text: "Your"), TextSpan(text: "Journey",style: TextStyle(color: Colors.green))
                          ])
                      ),
                    ),
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                    labelName: 'Name',
                    controller: _namController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name field can't be blank.";
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return "Please enter a valid name.";
                      }
                    },
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                    labelName: "Email",
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email field can't be blank.";
                      }
                      if (!value.contains('@')) {
                        return "Enter a valid email.";
                      }
                    },
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                    labelName: "Mobile",
                    controller: _mobileController,
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter mobile number.";
                      }
                    },
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                    labelName: "Password",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    controller: _passwordController,
                    obsecureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password field can't be blank.";
                      }
                    },
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                    labelName: "Confirm Password",
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    obsecureText: true,
                    controller: _confmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm password can't be blank.";
                      }
                      if (value != _passwordController.text) {
                        return "Password don't match.";
                      }
                    },
                  ),
                  CustomWidget.customSizeBox(context),
                  Center(
                    child: CustomWidget.CustomButton(
                      buttonName: "Submit",
                      backgroundColor: Colors.white,
                      fontSize: 20,
                      onPressed: _registerUser,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
