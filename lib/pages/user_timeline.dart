import 'dart:convert';
import 'package:gitgram/widgets/users_timeline_card.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:gitgram/model/user_timeline_model.dart';

class UserTimeline extends StatefulWidget {
  final String login;
  const UserTimeline({super.key, required this.login});

  @override
  State<UserTimeline> createState() => _UserTimelineState();
}

class _UserTimelineState extends State<UserTimeline> {
  List<UserTimelineModel> timeline = [];
  Future<List<UserTimelineModel>> fetchUserTmeline() async {
    final response = await http.get(Uri.parse(
        'https://api.github.com/users/${widget.login}/events/public'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      timeline.clear();
      for (Map i in data) {
        timeline.add(UserTimelineModel.fromJson(i.cast()));
      }
      return timeline;
    } else {
      return timeline;
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
          future: fetchUserTmeline(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                itemCount: timeline.length,
                itemBuilder: (context, index) {
                  return UserTimelineCard(
                    avatar_url: timeline[index].actor!.avatarUrl.toString(),
                    createdAt: timeline[index].createdAt.toString(),
                    login: timeline[index].actor!.login.toString(),
                    reponame: timeline[index].repo!.name.toString(),
                    type: timeline[index].type.toString(),
                  );
                });
          }),
    );
  }
}
