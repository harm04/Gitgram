import 'package:flutter/material.dart';
import 'package:gitgram/pages/mobile_layout.dart';
import 'package:gitgram/provider/profile_provider.dart';
import 'package:gitgram/provider/repo_provider.dart';
import 'package:gitgram/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => RepoProvider()),

        ChangeNotifierProvider(create: (context) => ProfileProvider()),

      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              color: Colors.black,
            )),
        home: const MobileLayout(),
      ),
    );
  }
}
