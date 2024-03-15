import 'package:flutter/material.dart';
import 'package:movie_api/app/views/home/HomePages/newspage/news.dart';

import '../../widgets/bottom_nav.dart';
import '../../../utils/colors.dart';
import 'homepage/homepage.dart';
import 'profilepage/profile.dart';
import 'searchpage/serach.dart';
import 'wishlist_page/wishlist.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const Search(),
    const NewsPage(),
    const WishList(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.kBlackColor,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
