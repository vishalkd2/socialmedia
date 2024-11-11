import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/firebase_options.dart';
import 'package:socialmedia/screen/AppStart.dart';
import 'package:socialmedia/screen/HomePage.dart';
import 'package:socialmedia/screen/LandingPage.dart';
import 'package:socialmedia/screen/IntroductionScreen.dart';
import 'package:socialmedia/screen/SplashScreen.dart';
import 'package:socialmedia/screen/UserProfile.dart';
import 'package:socialmedia/screen/UserRegistration.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/':(context)=>const  AppStart(),
        '/introduction':(context)=>IntroductionScreenPage(),
        '/landingpage':(context)=> const LandingPage(),
        '/splash':(context)=> const SplashScreen(),
        '/home':(context)=> const HomePage(),
        '/userprofile':(context)=> const UserProfile(),
        '/useregistration':(context)=> const UserRegistration(),
      },
    );
  }
}