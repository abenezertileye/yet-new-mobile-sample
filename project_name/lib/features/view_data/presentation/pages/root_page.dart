import 'package:flutter/material.dart';
import 'package:project_name/features/view_data/presentation/pages/history_page.dart';
import 'package:project_name/features/view_data/presentation/pages/home_page.dart';
import 'package:project_name/features/view_data/presentation/pages/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int startindex = 0;
  // The different pages will be listed here
  final List<Widget> _children = [
    HomePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[startindex],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.white,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 56,
          labelTextStyle: WidgetStateProperty.resolveWith<TextStyle?>(
            (Set<WidgetState> states) {
              if (states.contains(WidgetState.selected)) {
                return const TextStyle(color: Colors.blue);
              } else {
                return const TextStyle(color: Colors.black);
              }
            },
          ),
        ),
        child: NavigationBar(
          animationDuration: const Duration(milliseconds: 200),
          backgroundColor: Colors.white,
          selectedIndex: startindex,
          onDestinationSelected: (index) {
            setState(() {
              startindex = index;
            });
          },
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: Colors.blue,
                size: 27,
              ),
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 24,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.person,
                color: Colors.blue,
                size: 27,
              ),
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: 24,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
