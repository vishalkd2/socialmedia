import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmedia/model/PostModel.dart';
import 'package:socialmedia/services/DataService.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('World Leaders'),centerTitle: true,backgroundColor: Colors.cyan.withOpacity(0.5)),
      floatingActionButton: FloatingActionButton(onPressed: null,child: Icon(Icons.post_add)),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer user info
            UserAccountsDrawerHeader(
                accountName: Text('Vishal  Dubey',style: TextStyle(fontWeight: FontWeight.bold,),),
                accountEmail: Text('Vishaldubey@lifelayer.org',style: TextStyle(decoration: TextDecoration.underline,),),
              currentAccountPicture:CircleAvatar(
                backgroundColor: Colors.white,
                child: ClipOval(child: Image.asset('assets/user/profilepicture.jpg',)),
              ) ,decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/user/profbackground.jpg'),fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken)),)),

            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Message'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: (){},
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: ()async{
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/landingpage');
              },
            ),
            SizedBox(height: 100,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(child: Text("© 2024 Vishal Dubey. All rights reserved.",style: TextStyle(fontSize: 14,fontStyle: FontStyle.italic,decoration: TextDecoration.underline),)),
            )
          ],
        ),
      ),
      body: FutureBuilder<List<PostModel>>(
          future: DataService().getUsers(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }if(snapshot.hasError){
              return Center(child: Text('Loading error'));
            }if(!snapshot.hasData||snapshot.data!.isEmpty){
              return Center(child: Text('No user found data'));
            }
            var users=snapshot.data!;
            return ListView.builder(
              itemCount: users.length,
                itemBuilder: (context,index){
                var user=users[index];
                return Padding(padding: EdgeInsets.all(1.0),
                  child: Card(
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    elevation: 4.0,
                    child:Column(crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.pushNamed(context, '/userprofile');},
                        child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(radius: 18,backgroundImage: NetworkImage(user.userProfilePic),),
                          SizedBox(width: 10),
                          Text(user.userName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)
                        ],),
                      ),
                      for(var post in user.posts)
                        Column(
                          children: [
                            SizedBox(height: 3),
                            Image.network(post.postImage),
                            SizedBox(height: 3),
                            Row(children: [
                              SizedBox(width: 5),
                              Icon(Icons.favorite_border),
                              SizedBox(width: 5),
                              Icon(Icons.comment)
                            ],),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(post.postTitle,style: TextStyle(fontSize: 15),),
                            )
                          ],
                        )
                    ],
                    )),);
                }
            );
          }
      )
    );
  }
}
