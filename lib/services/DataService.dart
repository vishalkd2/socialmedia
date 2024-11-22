// data_service.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import '../model/PostModel.dart'; // For loading local files

class DataService {
  Future<List<PostModel>> getUsers() async {
    // Load the JSON file from assets
    final String response = await rootBundle.loadString('assets/jsondata/data.json');
    final data = json.decode(response);

    // Map JSON to User objects
    var usersList = (data['users'] as List)
        .map((userJson) => PostModel.fromJson(userJson))
        .toList();

    return usersList;
  }
}
