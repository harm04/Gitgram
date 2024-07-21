import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gitgram/model/user_friends_model.dart';
import 'package:gitgram/pages/searched_user_profile.dart';
import 'package:gitgram/widgets/users_frnds_card.dart';

import 'package:http/http.dart' as http;

class UsersFriends extends StatefulWidget {
  final String login;
  const UsersFriends({super.key, required this.login});

  @override
  State<UsersFriends> createState() => _UsersFriendsState();
}

class _UsersFriendsState extends State<UsersFriends> {
  List<UsersFriendsModel> friends = [];
  Future<List<UsersFriendsModel>> fetchUsersFriends() async {
    final response = await http.get(
        Uri.parse('https://api.github.com/users/${widget.login}/following'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      friends.clear();
      for (Map i in data) {
        friends.add(UsersFriendsModel.fromJson(i.cast()));
      }
      return friends;
    } else {
      return friends;
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
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } 
              return ListView.builder(
                  itemCount: friends.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SearchedUserProfile(
                            login:
                              friends[index].login.toString(),
                          );
                        }));
                      },
                      child: UsersFriendsCard(
                          avatar_url: friends[index].avatarUrl.toString(),
                          login: friends[index].login.toString() ),
                    );
                  });
            }));
  }
}
