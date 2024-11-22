import 'package:flutter/material.dart';
import 'package:socialmedia/model/UserRegistrationModel.dart';
import 'package:socialmedia/services/UserRegistrationService.dart';
import 'package:socialmedia/widgets/CustomWidget.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _UserRegistrationState();
}
class _UserRegistrationState extends State<UserRegistration> {
  final _firstNamController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final UserRegistrationService _userRegistrationService=UserRegistrationService();

  Future<void> _registerUser()async{
    if(_formKey.currentState?.validate()??false){
      final firstName=_firstNamController.text;
      final lastName=_lastNameController.text;
      final email=_emailController.text;
      final password=_passwordController.text;
      final profilepic=null;

      final userModel=UserRegistrationModel(firstname: firstName, lastname: lastName, email: email, password: password,profilepic: profilepic);

      bool isRegistered=await _userRegistrationService.registerUser(userModel);
      if(isRegistered){
        _showSuccessDialog(context);
      }else{
        _showErrorDialog(context);
      }
    }
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
                    labelName: 'First Name',
                    controller: _firstNamController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Fisrt name field can't be blank.";
                      }
                      if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                        return "Please enter a valid fisrt name.";
                      }
                    },
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                    labelName: "Last Name",
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Last name can't be blank.";
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
                      onPressed: _registerUser
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

void _showSuccessDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Registration Successful."),
          content: Text("You have successfully registerd."),
          actions: [
            TextButton(onPressed: (){Navigator.pushReplacementNamed(context, '/landingpage');}, child: Text("OK"))
          ],
        );
      });
}
void _showErrorDialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Registration failed"),
          content: Text("An error occurred during registration. Please try again."),
          actions: [
            TextButton(onPressed: (){Navigator.pop(context);;}, child: Text("OK"))
          ],
        );
      });
}
