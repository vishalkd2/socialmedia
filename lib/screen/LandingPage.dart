import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/widgets/CustomWidget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  @override
  State<LandingPage> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<LandingPage> {
  final _emailController=TextEditingController();
  final _passwordController=TextEditingController();
  final FirebaseAuth _auth=FirebaseAuth.instance;
  final _formKey=GlobalKey<FormState>();
  String? _errorMessage;
  Future<void> _login()async{
    if(!_formKey.currentState!.validate()){
      return;
    }
    try{
      print('checking breaking point debugging');
      final UserCredential userCredential=await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim()
      );
      Navigator.pushReplacementNamed(context, '/home');
    }catch(e){
      setState(() {
        _errorMessage=e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan.withOpacity(.5),
        title: Text("Social Media"),
        centerTitle: true,
      ),
      body: Stack(
        children: [Positioned.fill(child: Image.asset('assets/background/socialmediabackground.jpg',fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.7))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  CustomWidget.customSizeBox(context),
                  ClipOval(child: Image.asset('assets/background/night.png',height: MediaQuery.of(context).size.height * 0.25)),
                  CustomWidget.customSizeBox(context),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: 'Live ', style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.deepOrange)),
                        TextSpan(text: 'laugh ', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
                        TextSpan(text: 'share',style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold, color: Colors.green)),
                      ],
                    ),
                    textAlign: TextAlign.center, // Center the text
                  ),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(labelName: 'Email', keyboardType: TextInputType.emailAddress,controller: _emailController, validator: (value){if(value==null||value.isEmpty){return "Email field cant be null.";}}),
                  CustomWidget.customSizeBox(context),
                  CustomWidget.customTextFormField(labelName: 'Password', keyboardType: TextInputType.text,obsecureText: false,controller: _passwordController, validator: (value){if(value==null||value.isEmpty){return "Password field cant be null";}}),
                  CustomWidget.customSizeBox(context),
                  Container(alignment: Alignment.centerRight,child: Text("Forget Password",style: TextStyle(color: Colors.white),)),
                  CustomWidget.customSizeBox(context),
                  Center(child: CustomWidget.CustomButton(buttonName: 'Login',backgroundColor: Colors.blue, fontSize: 25, onPressed:_login),),
                  SizedBox(height: MediaQuery.sizeOf(context).height*.08),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/useregistration');
                    },
                    child: Center(
                      child: RichText(text: TextSpan(children: [
                        TextSpan(text: "Dont't have account ?",style: TextStyle(color: Colors.white,fontSize: 15)),
                        TextSpan(text: " Click Here",style: TextStyle(color: Colors.blue,fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline))
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