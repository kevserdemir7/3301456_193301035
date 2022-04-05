import 'package:book_shop/books_model.dart';
import 'package:book_shop/page_2.dart';
import 'package:flutter/material.dart';

import 'library_model.dart';

class BookHome extends StatefulWidget {
  @override
  _BookHomeState createState() => _BookHomeState();
}

class _BookHomeState extends State<BookHome> {
  int selectedSideMenuIndex = 0;

  List<String> sideList = ["Kitap", "Dergi", "Kırtasiye"];

  Widget sideWidget(int index) {
    return GestureDetector(
      onTap: () {
        selectedSideMenuIndex = index;
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
                border: Border.all(
                    color: selectedSideMenuIndex == index
                        ? Color(0xFF804969)
                        : Colors.white,
                    width: 2),
                borderRadius: BorderRadius.circular(20)),
          ),
          SizedBox(width: 5),
          RotatedBox(
            quarterTurns: -1,
            child: Text(
              sideList[index],
              style: TextStyle(
                  color: selectedSideMenuIndex == index
                      ? Color(0xFF804969)
                      : Color(0xFFecdee6),
                  fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }

  Widget getItemsWidget(int index, Books item) {
    return Container(
      padding: EdgeInsets.only(left: index == 0 ? 35 : 0),
      margin: EdgeInsets.only(right: 19),
      width: index == 0 ? 240 : 205,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => DetailsScreen(),
            ),
          );
        },
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 40, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(75),
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  color: Color(0xFF496282),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 7,
                        child: Container(
                          width: double.infinity,
                          padding:
                              EdgeInsets.only(left: 24, right: 24, top: 61),
                          decoration: BoxDecoration(
                              color: Color(0xFFf3f0f1),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(23),
                                  bottomLeft: Radius.circular(23))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                item.name,
                                style: TextStyle(
                                    color: Color(0xFF917264),
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.clip,
                              ),
                              SizedBox(height: 33),
                              Text(
                                item.writer[0],
                                style: TextStyle(
                                    color: Color(0xFFc8b7af), fontSize: 15.5),
                                overflow: TextOverflow.clip,
                              ),
                              Text(
                                item.writer[1],
                                style: TextStyle(
                                    color: Color(0xFFc8b7af), fontSize: 15.5),
                                overflow: TextOverflow.clip,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 18, right: 18),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                item.price,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                                overflow: TextOverflow.clip,
                              ),
                              Icon(Icons.add, color: Colors.white, size: 29)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.directional(
              textDirection: TextDirection.ltr,
              start: 30,
              top: -2,
              child: Image(
                width: 170,
                height: 90,
                fit: BoxFit.contain,
                image: AssetImage("assets/images/${itemList[index].imageUrl}"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBookWidget(Library book) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 18, horizontal: 26),
      height: 90,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              child: Image(
                height: 90,
                width: 90,
                fit: BoxFit.cover,
                image: AssetImage("assets/images/${book.imageUrl}"),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: EdgeInsets.only(left: 21, top: 6, bottom: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    book.name,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xFF56463b), fontSize: 25),
                  ),
                  SizedBox(height: 10),
                  Text(
                    book.address,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    style: TextStyle(color: Color(0xFFc8b7af), fontSize: 20.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFF999999),
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 100, left: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 10),
                                Text(
                                  "Mobil Kütüphane",
                                  style: TextStyle(
                                      color: Color(0xFFfefcfa), fontSize: 30),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 200,
                                  padding: EdgeInsets.only(top: 2),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF496282),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                    ),
                                  ),
                                  child: Center(
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'Önerilenler ',
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontSize: 20.5),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(80),
                          ),
                          child: Container(
                            color: Colors.white,
                            child: ListView(
                              children: <Widget>[
                                SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  height: 310,
                                  color: Colors.white,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(top: 35),
                                          color: Colors.white,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: sideList
                                                .asMap()
                                                .entries
                                                .map((MapEntry map) {
                                              return sideWidget(map.key);
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          child: ListView(
                                            scrollDirection: Axis.horizontal,
                                            children: itemList
                                                .asMap()
                                                .entries
                                                .map((MapEntry map) {
                                              return getItemsWidget(
                                                  map.key, map.value);
                                            }).toList(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.only(
                                      left: 26, right: 26, top: 26, bottom: 16),
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "Kütüphaneler",
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: 31,
                                          color: Color(0xFF5e4337),
                                        ),
                                      ),
                                      Text(
                                        "İstanbul",
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Color(0xFF804969),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                for (Library bookValue in bookList)
                                  getBookWidget(bookValue)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
