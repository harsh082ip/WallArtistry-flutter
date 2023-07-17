import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:wallartistry/views/screens/view_profile_handles.dart';

import 'package:wallartistry/views/widgets/app_drawer.dart';
import 'package:wallartistry/views/widgets/profile_handles.dart';
import '../widgets/custom_appbar.dart';

class DevelopersAboutScreen extends StatelessWidget {
  const DevelopersAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Wall',
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 191, 0), fontSize: 25.0),
              ),
              TextSpan(
                text: 'Artistry',
                style: TextStyle(
                  color: Color.fromARGB(255, 40, 225, 46),
                  fontSize: 27.0,
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.black12,
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                ClipOval(
                  child: Container(
                    width: 140,
                    height: 140,
                    color: Colors.amber,
                    child: Image.network(
                      'https://pbs.twimg.com/profile_images/1635029193913139200/lpZDxWWH_400x400.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.0),
                  child: const ListTile(
                    title: Text(
                      'About Me',
                      style: TextStyle(
                          fontSize: 25.0,
                          letterSpacing: 2,
                          decoration: TextDecoration.underline),
                    ),
                    subtitle: Text(
                      'Hello Everyone👋, My name is Harsh Vardhan Singh, a passionate Flutter and DevOps enthusiast with a hunger for continuous learning 🚀📱 Curiosity-driven and constantly seeking out the latest technological advancements to broaden my skill set. 🙂🙂',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  'Wanna Connect with me?🤔',
                  style: TextStyle(fontSize: 22.0),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewProfileHandles(
                                profileUrl:
                                    'https://www.instagram.com/coolboyharsh_/')));
                  },
                  child: ProfileHandles(
                    imgUrl: 'assets/images/instagram.png',
                    containerColor: Colors.white,
                    text: 'Instagram',
                    textColor: Colors.black,
                    fontFamily: 'Pacifico',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewProfileHandles(
                                profileUrl: 'https://twitter.com/harsh082ip')));
                  },
                  child: ProfileHandles(
                    imgUrl: 'assets/images/twitter.png',
                    containerColor: Color.fromARGB(255, 3, 169, 244),
                    text: 'Twitter',
                    textColor: Colors.white,
                    fontFamily: 'Pacifico',
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewProfileHandles(
                                profileUrl: 'https://github.com/harsh082ip')));
                  },
                  child: ProfileHandles(
                      imgUrl: 'assets/images/github.png',
                      containerColor: Colors.white,
                      text: 'Github',
                      textColor: Colors.black,
                      fontFamily: 'Pacifico'),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewProfileHandles(
                                profileUrl:
                                    'https://www.linkedin.com/in/harsh-vardhan-singh-35852a252/')));
                  },
                  child: ProfileHandles(
                      imgUrl: 'assets/images/linkedin.png',
                      containerColor: Color.fromARGB(255, 0, 119, 181),
                      text: 'Linkedin',
                      textColor: Colors.white,
                      fontFamily: 'Pacifico'),
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
