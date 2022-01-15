import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/display/barber_screen.dart';
import 'package:flutter_application_1/screens/display/images_screen.dart';
import 'package:flutter_application_1/services/barber.dart';
import 'package:flutter_application_1/services/gallery.dart';
import 'package:flutter_application_1/services/salon.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_application_1/services/service.dart';
// import 'package:flutter_laravel/screens/views/navbar.dart';

import 'package:provider/provider.dart';



//import 'package:outline_material_icons/outline_material_icons.dart';

// var serviceList = [
//   {'title': 'Men\s Hair Cut', 'duration': 45, 'price': 30},
//   {'title': 'Women\s Hair Cut', 'duration': 60, 'price': 50},
//   {'title': 'Color & Blow Dry', 'duration': 90, 'price': 75},
//   {'title': 'Oil Treatment', 'duration': 30, 'price': 20},
// ];
bool like = true;
var serviceList = Service.services;

class ServiceScreen extends StatelessWidget {
  final stylist;
  // var i=0;

// Widget isLike(context){
//   if(true){

//     return MaterialButton(
//       onPressed: ()async {
//         await Provider.of<Salon>(context,listen: false).addLike(stylist["id"]);

//           like=true;
//           print(stylist["likes"]);
//       },
//        padding: EdgeInsets.all(10),
//       shape: CircleBorder(),
//       color: Colors.white,
//       child: Icon(Icons.thumb_up_alt_outlined),
//     );
//   }else{
//     return MaterialButton(
//       onPressed: () {
//           like=false;
//           print(stylist["likes"]);
//       },
//       padding: EdgeInsets.all(10),
//       shape: CircleBorder(),
//       color: Colors.white,
//       child: Icon(Icons.thumb_up),
//     );
//   }
// }
  void onLikeButtonTapped(bool isLiked) async {
    /// send your request here
    if (isLiked) {
      print("not ok");
    } else {
      // Dio.Response response = await dio().put('/salon/addlike/$stylist["id"]');
      // stylist=response.data;
      // await Provider.of<Salon>(context,listen: false).addLike(stylist["id"]);
      print("ok");
    }
    // final bool success= await sendRequest();

    /// if failed, you can do nothing
    // return success? !isLiked:isLiked;

    // return !isLiked;
  }

  ServiceScreen(this.stylist);
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
                    // Image.network("http://10.0.2.2:8000/storage/images/EfLSG6WmklHc063a1VGgvBbTVM4yye92YV0bJpIm.jpg"),
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
                    Navigator.pop(context);
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
                            children: List.generate(serviceList.length,
                                (i) => ServiceTile(serviceList[i])),
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
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // Row(
                          //   children: <Widget>[
                          //     Icon(
                          //       Icons.star,
                          //       size: 16,
                          //       color: Color(0xffFF8573),
                          //     ),
                          //     SizedBox(height: 5),
                          //     Text(
                          //       stylist['rating'],
                          //       style: TextStyle(
                          //         color: Color(0xffFF8573),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Positioned(
              //   right: 10,
              //   top: MediaQuery.of(context).size.height / 3 - 55,
              //   child: IconButton(

              //     padding: EdgeInsets.all(10),
              //     color: Colors.white,
              //     icon:
              //     Icon(Icons.thumb_up),
              //     onPressed: () {
              //       print("ok");
              //     },
              //   ),
              // ),
              Positioned(
                right: 10,
                top: MediaQuery.of(context).size.height / 3 - 55,
                child: LikeButton(
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
                      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                      size: 40,
                    );
                  },
                  likeCount: stylist["likes"],
                  countBuilder: (int count, bool isLiked, String text) {
                    var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
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
                    if (isLiked) {
                      await Provider.of<Salon>(context, listen: false)
                          .deleteLike(stylist["id"]);
                      print("ok");
                    } else {
                      await Provider.of<Salon>(context, listen: false)
                          .addLike(stylist["id"]);
                    }
                    return !isLiked;
                  },
                ),
                // isLike(context)
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.orange[50],
          height: 60,
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        child: NavigationBar(
          backgroundColor: Colors.orange[50],
          destinations: [
            InkWell(
                child: Icon(
                  Icons.list_rounded,
                  color: Colors.grey,
                ),
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => SignUp()));
                }),
            InkWell(
                child: Icon(
                  Icons.photo_size_select_actual,
                  color: Colors.grey,
                ),
                onTap: () async {
                  await Provider.of<Gallery>(context, listen: false)
                      .show(stylist["user_id"]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryScreen(stylist)));
                }),
            InkWell(
                child: Icon(
                  Icons.person,
                  color: Colors.grey,
                ),
                onTap: () async {
                  await Provider.of<Barber>(context, listen: false)
                      .show(stylist['user_id']);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BarberScreen(stylist)));
                }),
            InkWell(
                child: Icon(
                  Icons.chat,
                  color: Colors.grey,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryScreen(stylist)));
                }),
          ],
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final service;
  ServiceTile(this.service);

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
        ],
      ),
    );
  }
}