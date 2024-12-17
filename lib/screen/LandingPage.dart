import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socialmedia/services/UserRegistrationService.dart';
import 'package:socialmedia/widgets/CustomWidget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _forgetPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _errorMessage;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkLogInStatus();
  }

  Future<void> _checkLogInStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    print('Is logged in: $isLoggedIn'); // Debugging the value
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    try {
      final isLoginSuccessful = await loginUser(email, password);
      if (isLoginSuccessful) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        print("Login Successful");
        Navigator.pushReplacementNamed(context, '/home');
      } else
        (e) {
          setState(() {
            _errorMessage = "Inavlid email or password";
          });
        };
    } catch (e) {
      setState(() {
        _errorMessage = "Error occured : ${e.toString()}";
      });
    }
  }

  Future<void> _forgetPassword() async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Provide your register mail"),
            content: CustomWidget.customTextFormField(
              controller:_forgetPasswordController,
              labelName: "Enter Mail",
              keyboardType: TextInputType.emailAddress,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel")),

              TextButton(
                  onPressed: () async{
                    String email = _forgetPasswordController.text.trim();
                    if (email.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Center(child: Text("Enter forget email"))));
                    } else {
                      bool suceess=await forgetPassword(email);
                      if(suceess){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Center(child: Text("Check your email to reset your password"))));
                    }}
                    Navigator.of(context).pop();
                  },
                  child: Text("OK")),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // if(_isLoading){
    //   return Scaffold(body: Center(child: CircularProgressIndicator(),),);
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.withOpacity(.5),
        title: Text("Social Media"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset('assets/background/socialmediabackground.jpg',
                  fit: BoxFit.cover,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black.withOpacity(0.7))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomWidget.customSizeBox(context),
                  ClipOval(
                      child: Image.asset('assets/background/night.png',
                          height: MediaQuery.of(context).size.height * 0.25)),
                  CustomWidget.customSizeBox(context),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'Live ',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrange)),
                        TextSpan(
                            text: 'laugh ',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        TextSpan(
                            text: 'share',
                            style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                      ],
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                      labelName: 'Email',
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email field cant be null.";
                        }
                      }),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(
                      labelName: 'Password',
                      keyboardType: TextInputType.text,
                      obsecureText: false,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password field cant be null";
                        }
                      }),
                  CustomWidget.customSizeBox(context),
                  Container(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: _forgetPassword,
                          child: Text(
                            "Forget Password",
                            style: TextStyle(color: Colors.white),
                          ))),
                  CustomWidget.customSizeBox(context),
                  Center(
                    child: CustomWidget.CustomButton(
                        buttonName: 'Login',
                        backgroundColor: Colors.blue,
                        fontSize: 25,
                        onPressed: _login),
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * .08),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/useregistration');
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Dont't have account ?",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15)),
                          TextSpan(
                              text: " Click Here",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline))
                        ]),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
