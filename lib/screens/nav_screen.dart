import 'package:flutter/material.dart';
import 'package:flutter_facebook/config/palette.dart';
import 'package:flutter_facebook/models/models.dart';
import 'package:flutter_facebook/screens/home_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = const [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconAndLabel> _icons = const [
    IconAndLabel(icon: Icons.home, label: 'Home'),
    IconAndLabel(icon: Icons.ondemand_video, label: 'Videos'),
    IconAndLabel(icon: Icons.person, label: 'Person'),
    IconAndLabel(icon: Icons.group, label: 'Group'),
    IconAndLabel(icon: Icons.notifications_active, label: 'Notification'),
    IconAndLabel(icon: Icons.menu, label: 'Menu'),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: _screens[_selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: _icons.map((value) {
              return BottomNavigationBarItem(
                  icon: Icon(value.icon), label: value.label);
            }).toList(),
            currentIndex: _selectedIndex,
            selectedItemColor: Palette.facebookBlue,
            onTap: _onItemTapped,
            unselectedItemColor: Colors.grey,
          ),
        ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
