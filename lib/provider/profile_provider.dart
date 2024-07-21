import 'dart:convert';
import 'package:gitgram/model/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  Future<ProfileModel> fetchprofile(String login) async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/$login'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return ProfileModel.fromJson(data);
    }
    notifyListeners();
    return ProfileModel.fromJson(data);
  }
}
