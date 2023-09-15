import 'package:flutter/material.dart';
import 'package:project2/about_me.dart';
import 'package:project2/stopwatch.dart';
import 'package:project2/timer.dart';

class NavBar extends StatefulWidget {
  final String name;
  final String email;

  const NavBar({Key? key, required this.name, required this.email})
      : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentPage = 0;

  List<Widget> pages = [
    StopWatch(name: '', email: ''), TimerPage(), AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages.elementAt(currentPage),
      bottomNavigationBar: NavigationBar(destinations: [
        NavigationDestination(
            icon: Icon(Icons.watch_later_rounded),
            label: 'Stopwatch'),
        NavigationDestination(
            icon: Icon(Icons.timer),
            label: 'Timer'),
        NavigationDestination(icon: Icon(Icons.person),
            label: 'About'
        )
      ],
        selectedIndex: currentPage,
        onDestinationSelected: (int value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
    );
  }
}
