import 'package:flutter/material.dart';
import 'package:zoom_clone/core/resources/color_manager.dart';
import 'package:zoom_clone/features/Chat/presentation/views/pages/my_chats_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoom_clone/features/Contacts/pages/my_contacts_screen.dart';
import 'package:zoom_clone/features/calls/calls_screen.dart';
import 'package:zoom_clone/features/settings/settings_page.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({Key? key}) : super(key: key);

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _currentIndex = 0;

  // Placeholder pages — replace with your actual screens
  final List<Widget> _pages = [
    const MyChatsScreen(),
    const CallsScreen(),
    const MyContactsScreen(),
    const SettingsPage(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: ColorManager.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.phone),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Contacts',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.cog),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
