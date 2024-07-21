import 'package:flutter/material.dart';
import 'package:gitgram/provider/repo_provider.dart';
import 'package:gitgram/widgets/search_repo_card.dart';
import 'package:provider/provider.dart';

class SearchRepo extends StatefulWidget {
  const SearchRepo({super.key});

  @override
  State<SearchRepo> createState() => _SearchRepoState();
}

class _SearchRepoState extends State<SearchRepo> {
  String repoController = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child:
          Consumer<RepoProvider>(builder: (context, repoproviderModel, child) {
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
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: 'MainFont'),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        repoController = value;
                      });
                    },
                     decoration: const InputDecoration(
                          hintText: 'Search for repositories',
                          hintStyle: TextStyle(fontFamily: 'MainFont'),
                          suffixIcon: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: ImageIcon(
                              AssetImage('assets/icons/ic_search.png'),
                              size: 15,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 5,
                  ),
                  repoController == ''
                      ?  Expanded(
                            child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text(
                                  'Explore the Github Repositories',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontFamily: 'MainFont'),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Image.asset(
                                  'assets/images/img_github_repo.png',
                                  height: 300,
                                ),
                              ],
                            ),
                          ))
                      : FutureBuilder(
                          future: repoproviderModel.fetchRepo(repoController),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Expanded(
                                child: ListView.builder(
                                    itemCount: snapshot.data!.items!.length,
                                    itemBuilder: (context, index) {
                                      return RepoCard(
                                        createdAt: snapshot
                                            .data!.items![index].createdAt
                                            .toString(),
                                        description: snapshot
                                            .data!.items![index].description
                                            .toString(),
                                        name: snapshot.data!.items![index].name
                                            .toString(),
                                        starcount: snapshot
                                            .data!.items![index].stargazersCount
                                            .toString(),
                                        watcherscount: snapshot
                                            .data!.items![index].watchersCount
                                            .toString(),
                                        index: (index + 1).toString(),
                                        login: snapshot
                                            .data!.items![index].owner!.login
                                            .toString(),
                                            html_url: snapshot.data!.items![index].htmlUrl.toString(),
                                      );
                                      // return Text(snapshot.data!.items![index].owner!.login.toString());
                                    }));
                          })
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
