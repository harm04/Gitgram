import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class UserReposCard extends StatefulWidget {
  final String name;
  final String description;
  final String createdAt;
  final String starcount;
  final String watcherscount;
  final String index;
  final String login;
  // ignore: non_constant_identifier_names
  final String html_url;
  const UserReposCard(
      {super.key,
      required this.name,
      required this.description,
      required this.createdAt,
      required this.starcount,
      required this.watcherscount,
      required this.index,
      required this.login,
      // ignore: non_constant_identifier_names
      required this.html_url});

  @override
  State<UserReposCard> createState() => _UserReposCardState();
}

class _UserReposCardState extends State<UserReposCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.index,
                style: const TextStyle(
                    color: Colors.white, fontSize: 20, fontFamily: 'MainFont')),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'MainFont'),
                        ),
                      ),
                      Link(
                          uri: Uri.parse(widget.html_url),
                          builder: (context, followLink) {
                            return InkWell(
                                onTap: followLink,
                                child: Image.asset(
                                  'assets/icons/ic_link.png',
                                  height: 20,
                                  color: Colors.grey,
                                ));
                          }),
                    ],
                  ),

                  // ignore: unnecessary_null_comparison
                  widget.description == null
                      ? const SizedBox()
                      : Text(
                          widget.description,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontFamily: 'MainFont'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        'createdAt: ',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'MainFont'),
                      ),
                      Text(
                        widget.createdAt,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontFamily: 'MainFont'),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(widget.starcount,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'MainFont')),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icons/ic_repostar.png',
                        height: 27,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(widget.watcherscount,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'MainFont')),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icons/ic_eye.png',
                        height: 27,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
