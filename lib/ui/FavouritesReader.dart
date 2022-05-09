
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

import 'package:store/models/Article.dart';

import 'ProductDetails.dart';

// ignore: must_be_immutable
class FavouritesReader extends StatefulWidget {
  String title;
  List<Article> list;

  FavouritesReader({this.title, this.list});

  @override
  _FavouritesReaderState createState() =>
      _FavouritesReaderState(title: title, list: list);
}

class _FavouritesReaderState extends State<FavouritesReader> {
  String title;
  List<Article> list;

  _FavouritesReaderState({this.title, this.list});

  @override
  void initState() {
    // TODO: implement initState



    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var pList = list;
    double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.first,
        title: Text(
          title,
          style: TextStyle(color: Colors.black,
          fontFamily: Roboto.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        ),
      ),
      body: (pList.length==0)? Center(
        child: Text(
          'No $title found',
          style: TextStyle(
            fontFamily: Roboto.medium,
            fontSize: 18,

          ),
        ),

      )  :ListView.builder(
        itemBuilder: (context, position) {
          return (list[position].favourite==0)? Container() : Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                //TODO: Set you own Data
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProductDetails(
                          list[position]
                      ),
                    ));
              },
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(5)),
                      Row(
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 20, bottom: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  image: pList[position].image[0],
                                  placeholder: "",
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                ),
                              )),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                height: 100,
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                          width: screenWidth-200,
                                          child: Text(

                                            pList[position].title,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: Roboto.bold),
                                          ),
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 3,
                                          ),
                                          child: Text(
                                            pList[position].label,
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: Roboto.medium,
                                                color: Colors.grey),
                                          ),
                                        ),
                                        Spacer()
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Spacer(),
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Text(
                                            pList[position].price.toString() + '\$',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: Roboto.medium,
                                                color: AppColors.first),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.8),
                        height: 1,
                      )
                    ],
                  ),
                  Positioned(
                    top: 5,
                    right: 7,
                    child: new IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          pList[position].favourite=0;
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: pList.length,
      ),
    );
  }
}
