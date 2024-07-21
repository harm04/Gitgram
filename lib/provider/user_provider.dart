import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gitgram/model/search_user_model.dart';

class UserProvider extends ChangeNotifier {
  Future<SearchUserModel> fetchUsers(String search) async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/search/users?q=$search&per_page=100'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SearchUserModel.fromJson(data);
    }
    notifyListeners();
    return SearchUserModel.fromJson(data);
  }
}
