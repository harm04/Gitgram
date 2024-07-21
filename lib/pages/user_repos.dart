import 'dart:convert';
import 'package:gitgram/widgets/users_repo_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gitgram/model/user_repos_model.dart';

class UserRepos extends StatefulWidget {
  final String login;
  const UserRepos({super.key, required this.login});

  @override
  State<UserRepos> createState() => _UserReposState();
}

class _UserReposState extends State<UserRepos> {
  List<UserReposModel> repos = [];
  Future<List<UserReposModel>> fetchUsersFriends() async {
    final response = await http
        .get(Uri.parse('https://api.github.com/users/${widget.login}/repos'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      repos.clear();
      for (Map i in data) {
        repos.add(UserReposModel.fromJson(i.cast()));
      }
      return repos;
    } else {
      return repos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/ic_star.png',
                height: 30,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'GitGram',
                style: TextStyle(
                    color: Colors.white, fontSize: 25, fontFamily: 'MainFont'),
              )
            ],
          ),
        ),
        body: FutureBuilder(
            future: fetchUsersFriends(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                const Center(child: Text('Loading'));
              }
              return ListView.builder(
                  itemCount: repos.length,
                  itemBuilder: (context, index) {
                    return UserReposCard(
                        name: repos[index].name.toString(),
                        description: repos[index].description.toString(),
                        createdAt: repos[index].createdAt.toString(),
                        starcount: repos[index].stargazersCount.toString(),
                        watcherscount: repos[index].watchersCount.toString(),
                        index: (index + 1).toString(),
                        login: repos[index].owner!.login.toString(),
                        html_url: repos[index].htmlUrl.toString());
                  });
            }));
  }
}
