import 'package:flutter/material.dart';
import 'package:socialmedia/widgets/CustomWidget.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.cyan.withOpacity(.5),
        title: Text("Social Media"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background/socialmediabackground.jpg',
              fit: BoxFit.cover,
              colorBlendMode: BlendMode.darken,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                CustomWidget.customSizeBox(context),
                ClipOval(
                  child: Image.asset(
                    'assets/background/night.png',
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                CustomWidget.customSizeBox(context),

                // Adding the RichText widget here
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Live ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Change color as needed
                        ),
                      ),
                      TextSpan(
                        text: 'laugh ',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Change color as needed
                        ),
                      ),
                      TextSpan(
                        text: 'share',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange, // Change color as needed
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),

                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(labelName: 'Email', keyboardType: TextInputType.emailAddress,),
                CustomWidget.customSizeBox(context),
                CustomWidget.customTextFormField(labelName: 'Password', keyboardType: TextInputType.text,obsecureText: false),
                CustomWidget.customSizeBox(context),
                Container(alignment: Alignment.centerRight,child: Text("Forget Password",style: TextStyle(color: Colors.white),)),
                CustomWidget.customSizeBox(context),
                Center(child: CustomWidget.CustomButton(buttonName: 'Login', backgroundColor: Colors.blue, fontSize: 25, onPressed:(){Navigator.pushNamed(context, '/home');})),
                SizedBox(height: MediaQuery.sizeOf(context).height*.08,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, '/useregistration');
                  },
                  child: Center(
                    child: RichText(text: TextSpan(children: [
                      TextSpan(text: "Dont't have account ?",style: TextStyle(color: Colors.white,fontSize: 16)),
                      TextSpan(text: " Click Here",style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.bold,))
                    ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}