import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

// ignore: must_be_immutable
class ReceiveCoupon extends StatefulWidget {
  String coupon;
  int value;

  ReceiveCoupon({this.coupon, this.value});

  @override
  _ReceiveCouponState createState() =>
      _ReceiveCouponState(coupon: coupon, value: value);
}

class _ReceiveCouponState extends State<ReceiveCoupon> {
  String buttonText = 'COPY';
  String coupon;
  int value;

  _ReceiveCouponState({this.coupon, this.value});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxStyle.withShadow,
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
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Congratulations!',
                  style: TextStyle(
                    fontFamily: Roboto.bold,
                    fontSize: 30,
                    color: AppColors.first,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Here\'s a \$$value for you, \n Purchase products in the app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: Roboto.regular
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 35, bottom: 40),
                padding:
                    EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
                decoration: BoxStyle.withShadow,
                child: Text(
                  coupon,
                  style: TextStyle(
                      fontFamily: Roboto.bold,
                      fontSize: 30,
                      letterSpacing: 5),
                ),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: (buttonText != 'COPY')
                    ? null
                    : () {
                        setState(() {
                          buttonText = 'COPIED';
                          Clipboard.setData(ClipboardData(text: coupon));
                        });
                      },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                  child: new Text(
                    buttonText,
                    style: new TextStyle(fontFamily: Roboto.bold),
                  ),
                ),
                color: AppColors.first,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
