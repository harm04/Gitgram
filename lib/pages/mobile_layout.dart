import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitgram/utils/page_list.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({super.key});

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  String username = "";
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pageList,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage('assets/icons/ic_person.png'),
              size: 40,
              color: (_page == 0) ? Colors.white : Colors.grey,
            ),
            label: 'Profiles',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
              icon: ImageIcon(
                const AssetImage('assets/icons/ic_repo.png'),
                size: 40,
                color: (_page == 1) ? Colors.white : Colors.grey,
              ),
              label: 'Repo',
              backgroundColor: Colors.white),
        
          BottomNavigationBarItem(
            icon: ImageIcon(
              const AssetImage('assets/icons/ic_about.png'),
              size: 20,
              color: (_page == 2) ? Colors.white : Colors.grey,
            ),
            label: 'About',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    );
  }
}
