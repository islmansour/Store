import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/ui/FavouritesReader.dart';
import 'package:store/ui/OrdersReader.dart';

import '../../Data.dart';

class BottomMenu extends StatefulWidget {
  final Function function;

  BottomMenu({Key key, this.function}) : super(key: key);

  @override
  _BottomMenuState createState() => _BottomMenuState();
}

class _BottomMenuState extends State<BottomMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.second,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: EdgeInsets.only(left: 40, right: 40),
      child: new Wrap(
        children: <Widget>[
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.fourth,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.only(
                top: 10,
              ),
              width: 70,
              height: 7,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              widget.function(4);
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fourth,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: new Icon(
                    OMIcons.person,
                    color: AppColors.third,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 11,
                  fontFamily: Roboto.regular),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => FavouritesReader(
                      title: 'Favourites',
                      list: Data.articles,
                    ),
                  ));
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fourth,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: new Icon(
                    OMIcons.favoriteBorder,
                    color: AppColors.third,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  'My Favourites',
                  style: TextStyle(color: Colors.white, fontSize: 11,fontFamily: Roboto.regular),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              widget.function(2);
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fourth,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: new Icon(
                    OMIcons.notifications,
                    color: AppColors.third,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  'Notifications',
                  style: TextStyle(color: Colors.white, fontSize: 11,fontFamily: Roboto.regular),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              widget.function(3);
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fourth,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: new Icon(
                    OMIcons.shoppingCart,
                    color: AppColors.third,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  'My Cart',
                  style: TextStyle(color: Colors.white, fontSize: 11,fontFamily: Roboto.regular),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {

              Navigator.pop(context);
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => OrdersReader(),
                  ));
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fourth,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: new Icon(
                    OMIcons.history,
                    color: AppColors.third,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  'Orders History',
                  style: TextStyle(color: Colors.white, fontSize: 11,fontFamily: Roboto.regular),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.fourth,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  padding:
                      EdgeInsets.only(left: 3, right: 3, top: 3, bottom: 3),
                  child: new Icon(
                    OMIcons.exitToApp,
                    color: AppColors.third,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                ),
                new Text(
                  'Logout',
                  style: TextStyle(color: Colors.white, fontSize: 11,fontFamily: Roboto.regular),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.fourth,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: EdgeInsets.only(top: 10, bottom: 10),
              width: 200,
              height: 7,
            ),
          ),
        ],
      ),
    );
  }
}
