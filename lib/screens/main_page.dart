import 'package:delivery/screens/BottomAppBar.dart';
import 'package:delivery/screens/favorite_page.dart';
import 'package:delivery/screens/home_page.dart';
import 'package:delivery/screens/notify_page.dart';
import 'package:delivery/screens/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  bool _isVisible = true;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(
        afterScrollResult: afterScrollResult,
      ),
      const FavoritePage(),
      const NotifyPage(),
      const ProfilePage()
    ];
  }

  afterScrollResult(bool visibility) {
    setState(() {
      _isVisible = visibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _isVisible ? 70 : 0,
          child:
              BottomNavBar(onTabChange: (index) => navigateBottomBar(index))),
      body: _pages[_selectedIndex],
    );
  }
}
