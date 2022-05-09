import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/models/Article.dart';
import 'package:store/ui/ProductsReader.dart';

import '../../Data.dart';
import '../ProductDetails.dart';

class HomePage extends StatefulWidget {
  final Function function;

  HomePage({Key key, this.function}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> listofProducts = Data.articles;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return RefreshIndicator(
      onRefresh: () async {
        //TODO: UPDATE YOUR DATA
        await Future.delayed(Duration(milliseconds: 700));
      },
      child: ListView(
        children: <Widget>[
          Container(
            decoration: BoxStyle.withShadow,
            margin: EdgeInsets.only(left: 20, right: 20, top: 20),
            child: GestureDetector(
              child: TextField(
                onTap: () {
                  widget.function(1);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: ' Search',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          // END OF SEARCH
          // START OF SMALL CATEGORIES
          Container(
              margin: EdgeInsets.only(top: 20),
              height: 80,
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      List<Article> cathegory = [];
                      for (int i = 0; i < Data.articles.length; i++) {
                        if (Data.articles[i].label ==
                            Data.categories[position].title) {
                          cathegory.add(Data.articles[i]);
                        }
                      }

                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ProductReader(
                              title: Data.categories[position].title,
                              list: cathegory,
                            ),
                          ));
                    },
                    child: Container(
                      height: 70,
                      width: 70,
                      decoration: BoxStyle.withShadow,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(
                        bottom: 5,
                        top: 5,
                        left: 20,
                        right: 20,
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Image.asset(
                            Data.categories[position].image,
                            width: 40,
                            height: 40,
                          ),
                          new Align(
                            child: new Text(
                              Data.categories[position].title,
                              style: TextStyle(fontFamily: Roboto.medium),
                            ),
                            alignment: Alignment.center,
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: Data.categories.length,
              )),
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
              top: 25,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: <Widget>[
                new Text(
                  'Sales 30%-70%',
                  style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                ),
                Spacer(),
                new InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ProductReader(
                            title: 'Discounts',
                            list: Data.articles,
                          ),
                        ));
                  },
                  child: Text(
                    'Show All >',
                    style: TextStyle(fontSize: 13, fontFamily: Roboto.regular),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 210,
            margin: EdgeInsets.only(top: 10),
            child: Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ProductDetails(Data.discount[position].article),
                          ));
                    },
                    child: Container(
                        margin: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                          right: 10,
                          left: (position == 0) ? 20 : 0,
                        ),
                        decoration: BoxStyle.withShadow,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: FadeInImage.assetNetwork(
                            //image:Exemples.discount[position].image,
                            image: Data.discount[position].image,
                            placeholder: '',
                            fit: BoxFit.cover,
                            width: 300,
                            height: 70,
                          ),
                        )),
                  );
                },
                itemCount: 3,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
              top: 25,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: <Widget>[
                new Text(
                  'Most Popular',
                  style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ProductReader(
                            title: 'Most Popular',
                            list: Data.articles,
                          ),
                        ));
                  },
                  child: Text(
                    'Show All >',
                    style: TextStyle(fontSize: 13, fontFamily: Roboto.regular),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 200,
            //width: 200,
            margin: EdgeInsets.only(top: 10),
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, position) {
                return InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              ProductDetails(Data.top[position]),
                        ));
                  },
                  child: Container(
                      margin: EdgeInsets.only(
                        right: 10,
                        left: (position == 0) ? 20 : 0,
                        top: 3,
                        bottom: 3,
                      ),
                      decoration: BoxStyle.withShadow,
                      child: Container(
                          child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: FadeInImage.assetNetwork(
                          image: Data.top[position].image[0],
                          placeholder: '',
                          fit: BoxFit.cover,
                          width: 200,
                          height: 200,
                        ),
                      ))),
                );
              },
              itemCount: Data.top.length,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 5,
              top: 25,
              left: 20,
              right: 20,
            ),
            child: Row(
              children: <Widget>[
                new Text(
                  'Recent',
                  style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ProductReader(
                            title: 'Recent',
                            list: Data.articles,
                          ),
                        ));
                  },
                  child: Text(
                    'Show All >',
                    style: TextStyle(fontSize: 13, fontFamily: Roboto.regular),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      //TODO: Set you own Data
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                ProductDetails(listofProducts[position]),
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
                                    margin:
                                        EdgeInsets.only(left: 20, bottom: 10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: FadeInImage.assetNetwork(
                                        //image:Exemples.discount[position].image,
                                        image:
                                            listofProducts[position].image[0],
                                        placeholder: '',
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
                                            width: screenWidth - 200,
                                            child: Text(
                                              listofProducts[position].title,
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
                                              Data.articles[position].brand,
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
                                              listofProducts[position]
                                                      .price
                                                      .toString() +
                                                  '\$',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: Roboto.bold,
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
                              (listofProducts[position].favourite == 0)
                                  ? OMIcons.favoriteBorder
                                  : Icons.favorite,
                              color: (listofProducts[position].favourite == 0)
                                  ? Colors.grey
                                  : Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                listofProducts[position].favourite =
                                    1 - listofProducts[position].favourite;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
