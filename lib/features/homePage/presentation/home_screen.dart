import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:music_player/core/constans/colors.dart';
import 'package:music_player/features/discoverPage/presentation/discover_screen.dart';
import 'package:music_player/features/library/presentation/library_screen.dart';
import 'package:music_player/features/profilePage/presentation/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DiscoverScreen(),
    const LibraryScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor: AppColors.secondary,
        selectedItemColor: AppColors.textPrimary,
        unselectedItemColor: AppColors.textSecondary,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Home.svg',
              color: _selectedIndex == 0
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              height: 24,
              width: 24,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Library.svg',
              color: _selectedIndex == 1
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              height: 24,
              width: 24,
            ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/Profile.svg',
              color: _selectedIndex == 2
                  ? AppColors.textPrimary
                  : AppColors.textSecondary,
              height: 24,
              width: 24,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
