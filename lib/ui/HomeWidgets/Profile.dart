import 'package:flutter/material.dart';
import 'package:store/Data.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/ui/HomeWidgets/profileWidgets/DialogWidget.dart';
import 'package:store/ui/HomeWidgets/profileWidgets/GenderDialog.dart';

class Profile extends StatefulWidget {
  final Function function;

  Profile({Key key, this.function}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile>   {
  String name = 'John Doe';
  String email = 'john@website.com';
  String gender = 'Male';
  String phone = '+21643543535';



  @override
  Widget build(BuildContext context) {
    double screenWidth=double.parse(MediaQuery.of(context).size.width.toString());

    return Container(
      color: AppColors.third,
      child: new ListView(
        children: <Widget>[
          Container(
            height: 250,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'images/background.png',
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
                Center(
                  child: Container(
                    decoration: BoxStyle.withShadow,
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            margin: EdgeInsets.only(top: 30, bottom: 15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: FadeInImage.assetNetwork(
                                image: Data.profileImage,
                                placeholder: "",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            width: screenWidth-100,
                            child: Text(
                              name,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,

                              style: TextStyle(
                                  fontSize: 25, fontFamily: Roboto.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(2),
                          ),
                          Container(
                            width: screenWidth-100,
                            child: Text(
                              email,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: Roboto.regular
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogWidget(
                    value: name,
                  );
                },
              ).then((value) {
                if (value != null) {
                  setState(() {
                    name = value.toString();
                  });
                }
              });
            },
            child: Container(
              decoration: BoxStyle.withShadow,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    'Full Name   ',
                    style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: screenWidth-250,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Roboto.regular
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                    ),
                    onPressed: () {
                      print('Hi');
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogWidget(
                    value: email,
                  );
                },
              ).then((value) {
                if (value != null) {
                  setState(() {
                    email = value.toString();
                  });
                }
              });
            },
            child: Container(
              decoration: BoxStyle.withShadow,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    'Email           ',
                    style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Container(
                    width: screenWidth-250,
                    child: Text(
                      email,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: Roboto.regular
                      ),
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                    ),
                    onPressed: () {
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return GenderDialog(
                    value: (gender == 'Male') ? 0 : 1,
                  );
                },
              ).then((value) {
                if (value != null) {
                  setState(() {
                    gender = value.toString();
                  });
                }
              });
            },
            child: Container(
              decoration: BoxStyle.withShadow,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    'Gender         ',
                    style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    gender,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: Roboto.regular
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                    ),
                    onPressed: () {
                      print('Hi');
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return DialogWidget(
                    value: phone,
                  );
                },
              ).then((value) {
                if (value != null) {
                  setState(() {
                    phone = value.toString();
                  });
                }
              });
            },
            child: Container(
              decoration: BoxStyle.withShadow,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
              child: Row(
                children: <Widget>[
                  Text(
                    'Phone          ',
                    style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                  ),
                  Text(
                    phone,
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: Roboto.regular
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      Icons.navigate_next,
                    ),
                    onPressed: () {
                      print('Hi');
                    },
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
    );
  }
}
