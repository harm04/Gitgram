import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gitgram/pages/user_repos.dart';
import 'package:gitgram/pages/user_timeline.dart';
import 'package:gitgram/pages/users_friends.dart';
import 'package:url_launcher/link.dart';

class ProfileCard extends StatefulWidget {
  final String login;
  // ignore: non_constant_identifier_names
  final String avatar_url;
  final String location;
  final String link;
  final String bio;
  final String createdAt;
  final String repos;
  final String following;
  final String followers;

  const ProfileCard({
    super.key,
    required this.login,
    // ignore: non_constant_identifier_names
    required this.avatar_url,
    required this.location,
    required this.link,
    required this.bio,
    required this.createdAt,
    required this.repos,
    required this.following,
    required this.followers,
  });

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 33,
                backgroundColor: Colors.white,
                child: CachedNetworkImage(
                  imageUrl: widget.avatar_url,
                  imageBuilder: (context, imageProvider) => Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
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
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.login,
                      style: const TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 1),
                          fontSize: 25,
                          fontFamily: 'MainFont'),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Repos',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'MainFont'),
                            ),
                            Text(
                              widget.repos,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'MainFont'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Followings',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'MainFont'),
                            ),
                            Text(
                              widget.following,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'MainFont'),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const Text(
                              'Followers',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'MainFont'),
                            ),
                            Text(
                              widget.followers,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'MainFont'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageIcon(AssetImage(
                'assets/icons/ic_person2.png',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.bio,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'MainFont'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageIcon(AssetImage(
                'assets/icons/ic_link.png',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                // child: Text(
                //   widget.link,
                //   style: const TextStyle(
                //       color: Colors.white,
                //       fontSize: 14,
                //       fontFamily: 'MainFont'),
                // ),
                child: Link(
                    uri: Uri.parse(widget.link),
                    builder: (context, followLink) {
                      return InkWell(
                        onTap: followLink,
                        child: Text(
                          widget.link,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'MainFont'),
                        ),
                      );
                    }),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageIcon(AssetImage(
                'assets/icons/ic_location.png',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.location,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'MainFont'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ImageIcon(AssetImage(
                'assets/icons/ic_createdAt.png',
              )),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  widget.createdAt,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'MainFont'),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserRepos(
                      login: widget.login,
                    );
                  }));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/images/img_repos.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Repositories',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'MainFont'),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UserTimeline(login: widget.login);
                  }));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/images/img_timeline.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Timeline',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'MainFont'),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return UsersFriends(
                      login: widget.login,
                    );
                  }));
                },
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset('assets/images/img_friends.png'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Friends',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'MainFont'),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
