import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

import '../../Data.dart';

class Notifications extends StatefulWidget {
  final Function function;

  Notifications({Key key, this.function}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.third,
      child: new ListView.builder(
          itemBuilder: (context, index) {
            return new Container(
              margin: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
                top: (index == 0) ? 20 : 0,
              ),
              decoration: BoxStyle.withoutShadow,
              child: Padding(
                padding: EdgeInsets.all(5),
                child: ListTile(
                  title: new Text(
                    Data.notifications[index].title,
                    style: new TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: Roboto.bold),
                  ),
                  subtitle: (Data.notifications[index].description == null)
                      ? null
                      : new Container(
                          margin: EdgeInsets.only(top: 2),
                          child: new Text(
                            Data.notifications[index].description,
                            style: new TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontFamily: Roboto.medium),
                          ),
                        ),
                  leading: new Image.asset(
                    Data.notifications[index].image,
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
            );
          },
          itemCount: Data.notifications.length),
    );
  }
}
