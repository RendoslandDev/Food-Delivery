// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  final void Function(int)? onTabChange;
  const BottomNavBar({super.key, required this.onTabChange});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return GNav(
        onTabChange: (value) => widget.onTabChange!(value),
        gap: 8,
        iconSize: 25,
        activeColor: Colors.red[900],
        tabs: [
          GButton(icon: Icons.home_max, text: "Home"),
          GButton(icon: Icons.favorite_border, text: "likes"),
          GButton(icon: Icons.notifications_none, text: "notified"),
          GButton(icon: Icons.person, text: "hire me"),
        ]);
  }
}
