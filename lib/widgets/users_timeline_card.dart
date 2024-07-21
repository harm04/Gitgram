import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class UserTimelineCard extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String avatar_url;
  final String type;
  final String login;
  final String reponame;
  final String createdAt;
  const UserTimelineCard(
      {super.key,
      // ignore: non_constant_identifier_names
      required this.avatar_url,
      required this.type,
      required this.login,
      required this.reponame,
      required this.createdAt});

  @override
  State<UserTimelineCard> createState() => _UserTimelineCardState();
}

class _UserTimelineCardState extends State<UserTimelineCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 200,
        child: TimelineTile(
          isFirst: false,
          alignment: TimelineAlign.start,
          beforeLineStyle: const LineStyle(color: Colors.white, thickness: 0.5),
          indicatorStyle: IndicatorStyle(
              color: widget.type == 'PushEvent'
                  ? Colors.pink
                  : widget.type == 'CreateEvent'
                      ? Colors.green
                      : widget.type == 'ForkEvent'
                          ? Colors.yellow
                          : widget.type == 'WatchEvent'
                              ? Colors.blue
                              : widget.type == 'DeleteEvent'
                                  ? Colors.red
                                  : Colors.grey,
              width: 50,
              iconStyle: IconStyle(iconData: Icons.done)),
          endChild: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                color: widget.type == 'PushEvent'
                    ? Colors.pink
                    : widget.type == 'CreateEvent'
                        ? Colors.green
                        : widget.type == 'ForkEvent'
                            ? Colors.yellow
                            : widget.type == 'WatchEvent'
                                ? Colors.blue
                                : widget.type == 'DeleteEvent'
                                    ? Colors.red
                                    : Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  SizedBox(
                      width: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.white,
                              child: CachedNetworkImage(
                                imageUrl: widget.avatar_url,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 20.0,
                                  height: 20.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) => Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGkAznCVTAALTD1o2mAnGLudN9r-bY6klRFB35J2hY7gvR9vDO3bPY_6gaOrfV0IHEIUo&usqp=CAU',
                                    fit: BoxFit.cover),
                                height: 70,
                                width: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              widget.login,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'MainFont',
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          widget.type == 'IssueCommentEvent'
                              ? 'Issue Comment'
                              : widget.type == 'IssuesEvent'
                                  ? 'Issues'
                                  : widget.type == 'WatchEvent'
                                      ? 'Watched'
                                      : widget.type ==
                                              'PullRequestReviewCommentEvent'
                                          ? 'Pull req review'
                                          : widget.type ==
                                                  'PullRequestReviewEvent'
                                              ? 'Pull req review'
                                              : widget.type == 'DeleteEvent'
                                                  ? 'Deleted'
                                                  : widget.type == 'PushEvent'
                                                      ? 'Pushed'
                                                      : widget.type ==
                                                              'CreateEvent'
                                                          ? 'Created'
                                                          : widget.type ==
                                                                  'ForkEvent'
                                                              ? 'Forked'
                                                              : widget.type ==
                                                                      'PullRequestEvent'
                                                                  ? 'Pull req'
                                                                  : widget.type,
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'MainFont',
                              fontSize: 18,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Repo',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'MainFont',
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                widget.reponame,
                                
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'MainFont',
                                    fontSize: 13,
                                   ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.createdAt,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'MainFont',
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
