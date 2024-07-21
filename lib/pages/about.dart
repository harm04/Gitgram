import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: const [
            SizedBox(
              height: 20,
            ),
            Text(
              'Welcome to Gitgram: The Ultimate Social Media Platform for Developers',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'MainFont'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Gitgram is the next-generation social media platform tailored specifically for developers. While existing platforms have excelled in connecting professionals, they often fall short in providing a seamless and enriched content experience. Gitgram bridges this gap by combining powerful GitHub integration with a user-friendly social media interface, creating a unified space where developers can find everything they need without juggling multiple accounts.Our vision is to make Gitgram more than just a tool – it’s a community where you can explore, connect, and grow your career. Whether you’re searching for GitHub users, exploring repositories, or keeping up with your friends’ activities, Gitgram makes it simple and intuitive. Our timeline feature lets you stay updated with the latest pushes, pulls, forks, and more, while direct navigation to GitHub ensures you’re always a click away from diving deeper.',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'MainFont'),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Thank you for joining us on this journey. We look forward to your insights and support as we build a meaningful, spam-free, and engaging platform for developers. Welcome to Gitgram – where your developer journey finds its home.',
              style: TextStyle(
                  color: Colors.white, fontSize: 15, fontFamily: 'MainFont'),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
