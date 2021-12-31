// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'signup_screen.dart';
import 'upgrade_salon.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  int index = 0;
  final screens = [
    //ServicesPage(),
    // GaleryPage(),
    // AccountPage(),    
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade100,
            height: 60,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            backgroundColor: Colors.grey,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.add_task_rounded),
                label: 'Services',
              ),
              NavigationDestination(
                icon: Icon(Icons.photo_size_select_actual),
                label: 'Galery',
              ),
              NavigationDestination(
                icon: Icon(Icons.info),
                label: 'Account Info',
              ),
            ],
          ),
        ),
      );
}
