import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/UserRegistrationModel.dart';

class UserRegistrationService {
  Future<bool> registerUser(UserRegistrationModel userModel) async {
    final String apiRegisterUrl = "http://192.168.1.6:5000/api/users/signup";
    try {
      final response = await http.post(
        Uri.parse(apiRegisterUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(userModel.toJson()), // Convert model to JSON
      );

      if (response.statusCode == 201) {
        // Registration successful
        return true;
      } else {
        // Handle server error
        return false;
      }
    } catch (e) {
      print("Error during registration: $e");
      return false;
    }
  }
}

//
Future<bool> loginUser(String email,String password) async{
  print('Login Function is working');
  final String apiLoginUrl ="http://192.168.1.6:5000/api/users/signin";

  try{
    final response=await http.post(
      Uri.parse(apiLoginUrl),
      headers: {'Content-type':'application/json'},
        body: jsonEncode({'email':email,'password':password}),
    );
    if(response.statusCode==200){
      return true;
    }else{
      return false;
    }
  }catch(e){
    print("Print error during login : $e");return false;
  }
}