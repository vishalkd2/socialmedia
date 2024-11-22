import 'dart:io';
import 'package:flutter/material.dart';


class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Sample data
  String username = 'Vishal Dubey';
  String email = 'Vishal.dubey@lifelayer.org';
  String gender = 'Male';
  String nationality = 'India';
  String bio = 'Hello, I am a Flutter Developer.';
  String backgroundPicUrl = 'assets/user/laptopbaackground1.jpg';
  String profilePicUrl = 'assets/user/profilepicture.jpg';
  List<String> postImages = [
    'https://storage.googleapis.com/a1aa/image/KCXewaamHyRqbyB5i8jWaisBlrfh4MTZ9SQyGtIDlZaVC1wTA.jpg',
    'https://storage.googleapis.com/a1aa/image/shXAEeyjZa2kViSXBw99NrI69dIkEY0ZvHC7COQcW9QMia4JA.jpg',
    'https://storage.googleapis.com/a1aa/image/QXLjrYWv6rIbBBo0mIkGrFdxiUYDucfeJwFaeOtorOONLqhnA.jpg',
    'https://storage.googleapis.com/a1aa/image/JO4DQMycBX5JFN9nA1tDEUiRaM6f800YtXD8vSwxt8jVka4JA.jpg',
    'https://storage.googleapis.com/a1aa/image/eHG7d7S3p9VyQiSA5q8wWoSdJKjHtbPOUW6z19rzmmG4ka4JA.jpg',
    'https://storage.googleapis.com/a1aa/image/yvoI5jKgQ3rxAhjtYdBWx2QfFsqCnZW8jwVyNMqtqKeBL1wTA.jpg',
    'https://storage.googleapis.com/a1aa/image/WpIaOKce1XWWFCQeILodjj75jVeEWz2rJCyeH7UcLJ1e0qGeE.jpg',
    'https://storage.googleapis.com/a1aa/image/JjuISJcfWxwXDKazRGr3BpBriiWDV1eX1xVaxetRrjNiyqhnA.jpg',
    'https://storage.googleapis.com/a1aa/image/PmDFcni7klYeSy51PcZCVo7n2KijPTsofnctwOKI8hUjZ1wTA.jpg',
    'https://storage.googleapis.com/a1aa/image/ZZkGvM8Yf8SydazH1lEEY7iHxm3YfKWeUsvkBjNEZfT8nVDPB.jpg',
    'https://storage.googleapis.com/a1aa/image/iNzDD96bC6JeLCXdexxcptMf2BW9LrK8H4xrH96UFaAWGxhnA.jpg',
    'https://storage.googleapis.com/a1aa/image/pRkLQ3iFXAoNF9dHxloBcZxB4iASoCLMZGfi5gCGibMBSc4JA.jpg',
    'https://storage.googleapis.com/a1aa/image/xPfC6Vdhn4U8f0jsm4sVfaR61HMAVlIW54I1qNBkKKJfSiDPB.jpg',
    'https://storage.googleapis.com/a1aa/image/1jTCrYarGjotARlHtHzLGuT7fCjnp7tq0AfWjBsDrW1Zm4wTA.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent.withOpacity(0.6),
      appBar: AppBar(automaticallyImplyLeading: false,toolbarHeight: 5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Background image with Edit icon
            Stack(
              children: [
                Image.asset(backgroundPicUrl,width: double.infinity,height: 200,fit: BoxFit.cover),
                Positioned(bottom: 10, right: 20, child: GestureDetector(onTap: (){}, child: Icon(Icons.edit, color: Colors.blue,size: 30))),
                Positioned(bottom:5,left:5,child:Stack(
                  children: [
                    CircleAvatar(radius: 60,backgroundImage:AssetImage('assets/user/profilepicture.jpg')),
                    Positioned(bottom: 0,right: 0,
                      child: GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(radius: 15, backgroundColor: Colors.blue,
                          child: Icon(Icons.edit,color: Colors.white, size: 16,)),
                      ),
                    ),
                  ],
                ),)
              ],
            ),
            // Background card below the profile picture
            Padding(padding: const EdgeInsets.all(2.0),
              child: Card(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,child: Padding(padding: const EdgeInsets.all(16.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text('Name: $username', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      // Email Row
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Email: $email', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      // Gender Row
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gender: $gender', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      // Nationality Row
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Nationality: $nationality', style: TextStyle(fontSize: 18)),
                        ],
                      ),
                      Divider(),
                      // Bio Row
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Bio: $bio', style: TextStyle(fontSize: 18),maxLines: 3,),
                          GestureDetector(
                            onTap: () {
                              // Handle edit action
                            },
                            child: Icon(Icons.edit),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Posts Section
            Padding(padding: const EdgeInsets.all(10.0),child: Text('Posts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),),
            // Post Images
            Card(elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,crossAxisSpacing: 8,mainAxisSpacing: 8,
                ),
                itemCount: postImages.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      postImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
