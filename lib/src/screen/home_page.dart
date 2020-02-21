import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_course_clone/src/theme/color/light_color.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  double statusBarHeight;

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: LightColor.purple,
        unselectedItemColor: Colors.grey.shade300,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          _bottomIcons(Icons.home),
          _bottomIcons(Icons.star_border),
          _bottomIcons(Icons.book),
          _bottomIcons(Icons.person),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[_header(context)],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _bottomIcons(IconData iconData) {
    return BottomNavigationBarItem(icon: Icon(iconData), title: Text(""));
  }

  Widget _header(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Material(
        color: LightColor.purple,
        child: Container(
          height: 200,
          width: width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 30,
                right: -100,
                child: _circularContainer(300, LightColor.lightpurple),
              ),
              Positioned(
                top: -100,
                left: -45,
                child: _circularContainer(width * .5, LightColor.darkpurple),
              ),
              Positioned(
                top: -180,
                right: -30,
                child: _circularContainer(
                  width * .7,
                  Colors.transparent,
                  borderColor: Colors.white12,
                ),
              ),
              Positioned(
                top: statusBarHeight,
                left: 0,
                child: Container(
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {},
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Search courese",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 30,
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Text(
                          "Type Something...",
                          style: TextStyle(color: Colors.white54, fontSize: 30, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _circularContainer(double size, Color color,
      {Color borderColor = Colors.transparent, double borderWidth = 2}) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: color, border: Border.all(color: borderColor, width: borderWidth)),
    );
  }
}
