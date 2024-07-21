import 'package:flutter/material.dart';
import 'package:gitgram/pages/about.dart';
import 'package:gitgram/pages/search_repo.dart';
import 'package:gitgram/pages/search_user.dart';

List<Widget> pageList = [
  const SearchUser(),
  const SearchRepo(),
  const AboutPage(),
];
