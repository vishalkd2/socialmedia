import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroductionScreenPage extends StatelessWidget {
  const IntroductionScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to Social Hub",
          body: "Stay connected with your friends, family, and the world. Share moments, ideas, and more.",
          image: ClipOval(child: Image.asset('assets/introductionimage/socialmedia.jpg',fit: BoxFit.cover)),
          decoration: const PageDecoration(
            imageFlex: 2,
            bodyFlex: 2,
            titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.green),
            bodyTextStyle: TextStyle(fontSize: 18,color: Colors.blueGrey),
            boxDecoration: BoxDecoration(color: Colors.white),
          )
        ),
        PageViewModel(
          title: "Share Your Moments",
          body: "Capture memories and share them with your community in a safe and fun environment.",
          image: ClipOval(child: Image.asset('assets/introductionimage/socialmedia2.jpg',fit: BoxFit.cover,)),
          decoration: const PageDecoration(
            imageFlex: 2,
            bodyFlex: 2,
            titleTextStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.green),
            bodyTextStyle: TextStyle(fontSize: 18,color: Colors.blueGrey),
            boxDecoration: BoxDecoration(color: Colors.white)
          ),
        ),
        PageViewModel(
          title: "Connect Globally",
          body: "Join a global network, interact with people from different cultures, and make new friends.",
          image: ClipOval(child: Image.asset('assets/introductionimage/socialmedia3.jpg',fit: BoxFit.cover,)),
          decoration: const PageDecoration(
            imageFlex: 2,
            bodyFlex: 2,
            titleTextStyle: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.green),
            bodyTextStyle: TextStyle(fontSize: 18,color: Colors.blueGrey),
            boxDecoration: BoxDecoration(color: Colors.white)
          )
        )
      ],
      onDone: (){
        Navigator.pushReplacementNamed(context, '/landingpage');
      },
      onSkip: (){
        Navigator.pushReplacementNamed(context, '/landingpage');
      },
      showSkipButton: true,
      skip: const Text("Skip",style: TextStyle(color: Colors.blue)),
      next: const Icon(Icons.arrow_forward,color: Colors.blue),
      done: const Text("Done",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.blue)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(22.0, 10.0),
        color: Colors.blue,
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
