import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavigationBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.kPrimary,
      unselectedItemColor: Colors.grey[400],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      elevation: 8.0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.home, size: 20),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.search, size: 20),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.news, size: 20),
          label: 'News',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.heart, size: 20),
          label: 'Wishlist',
        ),
        BottomNavigationBarItem(
          icon: Icon(CupertinoIcons.person, size: 20),
          label: 'Profile',
        ),
      ],
    );
  }
}
