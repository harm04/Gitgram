import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UsersFriendsCard extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String avatar_url;
  final String login;
  // ignore: non_constant_identifier_names
  const UsersFriendsCard({super.key, required this.avatar_url, required this.login});

  @override
  State<UsersFriendsCard> createState() => _UsersFriendsCardState();
}

class _UsersFriendsCardState extends State<UsersFriendsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.white,
            child: CachedNetworkImage(
              imageUrl: widget.avatar_url,
              imageBuilder: (context, imageProvider) => Container(
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                  fit: BoxFit.cover),
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            widget.login,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'MainFont'),
          )),
          
        ],
      ),
    );
  }
}