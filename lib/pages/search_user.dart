import 'package:flutter/material.dart';
import 'package:gitgram/pages/searched_user_profile.dart';
import 'package:gitgram/provider/user_provider.dart';
import 'package:gitgram/widgets/search_users_card.dart';
import 'package:provider/provider.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  String usercontroller = '';

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userproviderModel, child) {
      return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
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
                        usercontroller = value;
                      });
                    },
                    decoration: const InputDecoration(
                        hintText: 'Search for users',
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
                  usercontroller == ''
                      ? Expanded(
                          child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Explore the Github profiles with ease',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15,
                                    fontFamily: 'MainFont'),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Image.asset(
                                'assets/images/img_github.png',
                                height: 300,
                              ),
                            ],
                          ),
                        ))
                      : FutureBuilder(
                          future:
                              userproviderModel.fetchUsers(usercontroller),
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
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return SearchedUserProfile(login: snapshot.data!.items![index].login.toString(),);
                                        }));
                                      },
                                      child: UsersCard(
                                        avatar_url: snapshot
                                            .data!.items![index].avatarUrl
                                            .toString(),
                                        login: snapshot
                                            .data!.items![index].login
                                            .toString(),
                                        id: snapshot.data!.items![index].id
                                            .toString(),
                                      ),
                                    );
                                  }),
                            );
                          }),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
