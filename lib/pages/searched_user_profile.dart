import 'package:flutter/material.dart';
import 'package:gitgram/provider/profile_provider.dart';
import 'package:gitgram/widgets/profile_card.dart';
import 'package:provider/provider.dart';

class SearchedUserProfile extends StatefulWidget {
  final String login;
  const SearchedUserProfile({super.key, required this.login});

  @override
  State<SearchedUserProfile> createState() => _SearchedUserProfileState();
}

class _SearchedUserProfileState extends State<SearchedUserProfile> {
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
      body: Consumer<ProfileProvider>(
          builder: (context, profileproviderModel, child) {
        return FutureBuilder(
            future: profileproviderModel.fetchprofile(widget.login),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ProfileCard(
                login: snapshot.data!.login.toString(),
                avatar_url: snapshot.data!.avatarUrl.toString(),
                bio: snapshot.data!.bio.toString(),
                createdAt: snapshot.data!.createdAt.toString(),
                following: snapshot.data!.following.toString(),
                followers: snapshot.data!.followers.toString(),
                link: snapshot.data!.htmlUrl.toString(),
                location: snapshot.data!.location.toString(),
                repos: snapshot.data!.publicRepos.toString(),
              );
              // return Text(widget.login);
            });
      }),
    );
  }
}
