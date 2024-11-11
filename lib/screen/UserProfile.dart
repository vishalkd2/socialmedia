import 'package:flutter/material.dart';
import 'package:socialmedia/model/PostModel.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the user passed as an argument
    final PostModel user = ModalRoute.of(context)?.settings.arguments as PostModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile'),
        backgroundColor: Colors.blue,
      ),
      body: user != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                ClipOval(
                  child: Image.network(
                    user.userProfilePic,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                // User Name
                Text(
                  user.userName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                // Location and National Flag
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on),
                    Text(user.userLocation),
                    SizedBox(width: 10),
                    Image.network(user.nationFlag, width: 30, height: 20),
                  ],
                ),
                SizedBox(height: 10),
                // User Description
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(user.userDescription),
                ),
              ],
            )
          : Center(child: Text('User not found')),
    );
  }
}
