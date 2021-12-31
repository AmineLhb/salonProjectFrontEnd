// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'views/widgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AccountPage();
}

class _AccountPage extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        body:ListView(
          physics: BouncingScrollPhysics(),
          children: [
            
          ]
        )
      )
    ]);
  }
}
