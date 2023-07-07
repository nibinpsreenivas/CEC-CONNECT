import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cec_connect/utils/globalvar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController pageController;
  int _page = 0;
  bool isUser = false;
  final _auth = FirebaseAuth.instance;
  var userData = {};

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

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    //   return Scaffold(
    //     body: Center(child: Text('$isUser')),
    //   );
    return Scaffold(
        body: PageView(
          children: homeScreenItems,
          controller: pageController,
          onPageChanged: onPageChanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _page == 0 ? Colors.blue[700] : Colors.blue[700],
                ),
                label: '',
                backgroundColor: Colors.blue[700]),
            BottomNavigationBarItem(
                icon: Icon(
                  IconData(0xee40, fontFamily: 'MaterialIcons'),
                  color: _page == 1 ? Colors.blue[700] : Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.blue[700]),
            BottomNavigationBarItem(
                icon: Icon(
                  IconData(0xf013d, fontFamily: 'MaterialIcons'),
                  color: _page == 2 ? Colors.blue[700] : Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.blue[700]),
            BottomNavigationBarItem(
                icon: Icon(
                  IconData(0xf522, fontFamily: 'MaterialIcons'),
                  color: _page == 3 ? Colors.blue[700] : Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.blue[700]),
            BottomNavigationBarItem(
                icon: Icon(
                  IconData(0xe3e0, fontFamily: 'MaterialIcons'),
                  color: _page == 4 ? Colors.blue[700] : Colors.grey,
                ),
                label: '',
                backgroundColor: Colors.blue[700]),
          ],
          onTap: navigationTapped,
        ));
  }
}
