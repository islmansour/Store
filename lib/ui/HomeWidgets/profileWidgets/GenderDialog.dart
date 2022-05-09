import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';

// ignore: must_be_immutable
class GenderDialog extends StatefulWidget {
  int value;

  GenderDialog({this.value});

  @override
  _GenderDialogState createState() => _GenderDialogState(value: value);
}

class _GenderDialogState extends State<GenderDialog> {
  int value;

  _GenderDialogState({this.value});

  @override
  Widget build(BuildContext context) {
    int gender = value;

    return Dialog(
      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxStyle.withoutShadow,
        padding: EdgeInsets.only(bottom: 30),
        width: double.infinity,
        child: Wrap(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.clear),
              ),
              alignment: Alignment.topRight,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        value = 0;
                        Navigator.pop(
                            context, (value == 0) ? 'Male' : 'Female');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 40, left: 30, right: 10),
                      padding: EdgeInsets.all(5),
                      decoration: (gender == 0)
                          ? BoxStyle.withShadow
                          : BoxStyle.withoutShadow,
                      child: Image.asset(
                        'images/male.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        value = 1;
                        Navigator.pop(
                            context, (value == 0) ? 'Male' : 'Female');
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 40, left: 10, right: 30),
                      decoration: (gender == 1)
                          ? BoxStyle.withShadow
                          : BoxStyle.withoutShadow,
                      padding: EdgeInsets.all(5),
                      child: Image.asset(
                        'images/female.jpg',
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
