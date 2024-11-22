import 'package:flutter/material.dart';

class UserRegisterProvider extends ChangeNotifier {
  String? uid;
  String? name;
  String? email;
  String? mobile;
  String? password;
  bool isRegistering = false; // Track registration state

  UserRegisterProvider({this.uid, this.name, this.email, this.mobile,this.password});

  // Method to register user with provided details
  void registerUser(String uid, String name, String email, String mobile,String password) {
    this.uid = uid;
    this.name = name;
    this.email = email;
    this.mobile = mobile;
    this.password=password;
    isRegistering = true;  // Registration in progress
    notifyListeners(); // Notify listeners to update UI

    // Here, you could also add logic for handling the registration process like making API calls
  }

  // Optionally, a method to reset the registration state
  void resetRegistration() {
    uid = null;
    name = null;
    email = null;
    mobile = null;
    isRegistering = false;
    notifyListeners(); // Notify listeners to reset the UI
  }
}
