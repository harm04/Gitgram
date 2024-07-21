// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class RepoProvider extends ChangeNotifier {
//   var data;
//   Future<void> fetchRepo(String repoController) async {
//     final response = await http.get(Uri.parse(
//         ' https://api.github.com/search/repositories?q=${repoController}'));
//     if (response.statusCode == 200) {
//       data = jsonDecode(response.body.toString());
//       print(data['items']);
//       notifyListeners();
//     }
//   }
// }

import 'dart:convert';
import 'package:gitgram/model/search_repo_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RepoProvider extends ChangeNotifier {
  Future<SearchRepoModel> fetchRepo(String search) async {
    final response = await http.get(
        Uri.parse('https://api.github.com/search/repositories?q=$search&per_page=100'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      return SearchRepoModel.fromJson(data);
    }
    notifyListeners();
    return SearchRepoModel.fromJson(data);
  }
}
