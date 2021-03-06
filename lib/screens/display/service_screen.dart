import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/display/salons_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/views/navBottom.dart';
import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/services/salon.dart';
import 'package:flutter_application_1/services/service.dart';

import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
//import 'package:outline_material_icons/outline_material_icons.dart';

// var serviceList = [
//   {'title': 'Men\s Hair Cut', 'duration': 45, 'price': 30},
//   {'title': 'Women\s Hair Cut', 'duration': 60, 'price': 50},
//   {'title': 'Color & Blow Dry', 'duration': 90, 'price': 75},
//   {'title': 'Oil Treatment', 'duration': 30, 'price': 20},
// ];
bool like = true;

// var serviceList=Service.services;
class ServiceScreen extends StatelessWidget {
  final stylist;
  final services;
  void onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    if (isLiked) {
      print("not ok");
    } else {
      print("ok");
    }
  }

  ServiceScreen(this.stylist, this.services);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 3 + 20,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      'images/detail_bg.png',
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 50,
                left: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SalonsScreen()));
                  },
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3 - 35,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        Text(
                          'Service List',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color.fromARGB(255, 80, 135, 156),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(services.length,
                                (i) => ServiceTile(stylist, services[i])),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height / 3 - 120,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 10 - 20,
                        height: MediaQuery.of(context).size.height / 6 + 25,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 90),
                          Text(
                            stylist['salon_name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            stylist['phone'],
                            style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height / 3 - 55,
                  child: (Auth.role == 1)
                      ? LikeButton(
                          size: 40,
                          circleColor: CircleColor(
                              start: Color(0xff00ddff), end: Color(0xff0099cc)),
                          bubblesColor: BubblesColor(
                            dotPrimaryColor: Color(0xff33b5e5),
                            dotSecondaryColor: Color(0xff0099cc),
                          ),
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.thumb_up,
                              color: Salon.like[stylist["id"]]
                                  ? Colors.deepPurpleAccent
                                  : Colors.grey,
                              size: 40,
                            );
                          },
                          likeCount: stylist["likes"],
                          countBuilder: (int count, bool isLiked, String text) {
                            var color = Salon.like[stylist["id"]]
                                ? Colors.deepPurpleAccent
                                : Colors.grey;
                            Widget result;
                            if (count == 0) {
                              result = Text(
                                "love",
                                style: TextStyle(color: color),
                              );
                            } else
                              result = Text(
                                text,
                                style: TextStyle(color: color),
                              );
                            return result;
                          },
                          onTap: (isLiked) async {
                            if (Salon.like[stylist["id"]]) {
                              await Provider.of<Salon>(context, listen: false)
                                  .deleteLike(stylist["id"]);
                              stylist["likes"] = stylist["likes"] - 1;
                              print("ok");
                            } else {
                              await Provider.of<Salon>(context, listen: false)
                                  .addLike(stylist["id"]);
                              stylist["likes"] = stylist["likes"] + 1;
                            }
                            return !isLiked;
                          },
                        )
                      : Container(width: 0.0, height: 0.0)

                  // isLike(context)
                  ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavBottom(stylist),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final service;
  final stylist;
  ServiceTile(
    this.stylist,
    this.service,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width / 2 - 60,
                child: Text(
                  service['title'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
          Text(
            '\$${service['price']}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          (Auth.role == 2)
              ? IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () async {
                    print(service["id"]);
                    await Provider.of<Service>(context, listen: false)
                        .destroy(service["id"]);
                    await Provider.of<Service>(context, listen: false)
                        .show(service["user_id"]);
                    var services =
                        await Provider.of<Service>(context, listen: false)
                            .services;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ServiceScreen(stylist, services)));
                    print("ok");
                  })
              : Container(width: 0.0, height: 0.0)
        ],
      ),
    );
  }
}
