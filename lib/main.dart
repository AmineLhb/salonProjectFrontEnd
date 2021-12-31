import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/NavBar.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/map_screen.dart';
import 'package:flutter_application_1/screens/upgrade_salon.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:provider/provider.dart';

import 'screens/account_page.dart';
import 'screens/barber.dart';
import 'screens/services.dart';
import 'services/salon.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Salon()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ServicesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
