// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/services/barber.dart';
import 'package:flutter_application_1/services/gallery.dart';
import 'package:flutter_application_1/services/reserver.dart';
import 'package:flutter_application_1/services/salon.dart';
import 'package:flutter_application_1/services/service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
        ChangeNotifierProvider(create: (context) => Salon()),
        ChangeNotifierProvider(create: (context) => Gallery()),
        ChangeNotifierProvider(create: (context) => Barber()),
        ChangeNotifierProvider(create: (context) => Service()),
        ChangeNotifierProvider(create: (context) => Reserver()),
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
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
