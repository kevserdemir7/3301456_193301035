import 'package:flutter/material.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookShop(),
    );
  }
}

class BookShop extends StatefulWidget {
  @override
  _BookShopState createState() => _BookShopState();
}

class _BookShopState extends State<BookShop> {
  int selectedCurveIndex = 1;
  List<int> curveList = [0, 1, 2, 3];

  List<String> menuList = [
    "icon",
    "Giriş",
    "Üye Ol",
    "extraSpace"
  ];

  Widget getCurvedShape(int index) {
    if (index < 3) {
      return Expanded(
        flex: 2,
        child: AnimatedContainer(
          width: selectedCurveIndex > 0 &&
              selectedCurveIndex < 3 &&
              selectedCurveIndex == index
              ? double.infinity
              : 0,
          duration: Duration(seconds: 0),
          child: Stack(
            children: <Widget>[
              CustomPaint(painter: DrawCurveBulged(), child: Container()),
              Positioned.directional(
                textDirection: TextDirection.ltr,
                start: -1,
                top: 18,
                child: Container(
                  width: 3,
                  height: 137,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Expanded(flex: 1, child: Container());
    }
  }

  Widget getMenuList(int index) {
    if (index > 0 && index < 3) {
      return Expanded(
        flex: 2,
        child: GestureDetector(
          onTap: () {
            selectedCurveIndex = index;
            setState(() {});
          },
          child: Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RotatedBox(
                  quarterTurns: -1,
                  child: Text(
                    menuList[index],
                    style: TextStyle(color: Colors.grey[300], fontSize: 20),
                  ),
                ),
                SizedBox(width: 10),
                selectedCurveIndex == index
                    ? Container(
                  width: 11,
                  height: 11,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                )
                    : Container(width: 11, height: 11),
              ],
            ),
          ),
        ),
      );
    } else {
      if (index == 0) {
        return Expanded(
          flex: 2,
          child: Container(
            child: Transform.rotate(
              angle: 90 * (22 / 1260),
              child: Icon(
                Icons.menu,
                size: 25,
                color: Colors.grey[300],
              ),
            ),
          ),
        );
      } else {
        return Expanded(child: Container());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF999999),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(top: 14),
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 15,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:
                          menuList.asMap().entries.map((MapEntry map) {
                            return getMenuList(map.key);
                          }).toList(),
                        ),
                      ),
                    ),
                    Expanded(flex: 2, child: Container()),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 11,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF496282),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 15,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                          ),
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image:
                                    AssetImage("assets/images/stretch.png"),
                                  ),
                                ),
                              ),
                              Positioned.directional(
                                textDirection: TextDirection.ltr,
                                bottom: -150,
                                end: -1,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(90),
                                  ),
                                  child: Image(
                                    width: 310,
                                    height: 500,
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        "assets/images/giris.png"),
                                  ),
                                ),
                              ),
                              Container(
                                width: 36,
                                padding: EdgeInsets.only(top: 14),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                          MainAxisAlignment.start,
                                          children: curveList
                                              .asMap()
                                              .entries
                                              .map((MapEntry map) {
                                            return getCurvedShape(map.key);
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 40, top: 100),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Mobil Kütüphane",
                                      style: TextStyle(
                                          color: Color(0xFF4f3f34),
                                          fontSize: 30,
                                          letterSpacing: 1),
                                    ),
                                    SizedBox(height: 25),
                                    Text(
                                      "Geniş bir kitap ağı...",
                                      style: TextStyle(
                                          color: Color(0xFF9e9894),
                                          fontSize: 18),
                                    ),
                                    Text(
                                      "Şehrinizdeki kütüphaneler.",
                                      style: TextStyle(
                                          color: Color(0xFF9e9894),
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 50),
                                    TextField(
                                      cursorColor: Color(0xFFaba7a4),
                                      style: TextStyle(
                                          color: Color(0xFF4c3e33),
                                          fontSize: 21),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFaba7a4),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFaba7a4),
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFaba7a4),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    TextField(
                                      obscureText: true,
                                      cursorColor: Color(0xFFaba7a4),
                                      style: TextStyle(
                                          color: Color(0xFF4c3e33),
                                          fontSize: 21,
                                          letterSpacing: 6),
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFaba7a3),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFaba7a4),
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFaba7a4),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: EdgeInsets.only(left: 100, right: 30),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => BookHome(),
                              ),
                            );
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Devam",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 29),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white.withOpacity(.2),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white.withOpacity(.5),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white.withOpacity(.75),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawCurveBulged extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF999999)
      ..style = PaintingStyle.fill;
    Path path = Path();

    path.moveTo(-1, 0);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.125 * 1.8,
        size.width * .35, size.height * .125 * 2.52);

    path.quadraticBezierTo(size.width * .125 * 6, size.height * 0.125 * 4,
        size.width * .25, size.height * .125 * 5.8);

    path.quadraticBezierTo(
        size.width * .1, size.height * 0.125 * 6.52, -1, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
