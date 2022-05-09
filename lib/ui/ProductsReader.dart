import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/models/Article.dart';

import 'ProductDetails.dart';

// ignore: must_be_immutable
class ProductReader extends StatefulWidget {
  String title;
  List<Article> list;

  ProductReader({this.title, this.list});

  @override
  _ProductReaderState createState() =>
      _ProductReaderState(title: title, list: list);
}

class _ProductReaderState extends State<ProductReader> {
  String title;
  List<Article> list;

  _ProductReaderState({this.title, this.list});

  @override
  Widget build(BuildContext context) {
    var pList = list;
    double screenWidth=double.parse(MediaQuery.of(context).size.width.toString());

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
      body:(pList.length==0)? Center(
        child: Text(
          'No $title found',
          style: TextStyle(
            fontFamily: Roboto.medium,
            fontSize: 18,

          ),
        ),

      ) :  RefreshIndicator(
        onRefresh: () async{
          //TODO: UPDATE YOUR DATA
          await Future.delayed(Duration(milliseconds: 700));
          setState(() {

          });
        },
        child: ListView.builder(
          itemBuilder: (context, position) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        //TODO: Set you own Data
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
                                    //TODO: set your own placeholder image
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
                                              pList[position].brand,
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
                          (pList[position].favourite == 0)
                              ? OMIcons.favoriteBorder
                              : Icons.favorite,
                          color: (pList[position].favourite == 0)
                              ? Colors.grey
                              : Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            if (pList[position].favourite == 0) {
                              pList[position].favourite = 1;
                            } else {
                              pList[position].favourite = 0;
                            }
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
      ),
    );
  }
}
