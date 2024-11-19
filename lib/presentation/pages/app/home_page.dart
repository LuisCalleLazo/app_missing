import 'package:app_missing/presentation/provider/missing/notification_provider.dart';
import 'package:app_missing/presentation/widgets/navigation/navigation.dart';
import 'package:app_missing/presentation/screens/home/home_screen.dart';
import 'package:app_missing/presentation/screens/missing/missing_screen.dart';
import 'package:app_missing/presentation/screens/notification/notification_screen.dart';
import 'package:app_missing/presentation/screens/video/video_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String name = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const VideoScreen(),
    const NotificationScreen(),
    const MissingScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    int count = NotificationProvider().notifications.length;
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _screens,
      ),
      bottomNavigationBar: Navigation(
        onItemTapped: _onItemTapped,
        selectedIndex: _selectedIndex,
        notificationCount: count,
      ),
    );
  }
}
