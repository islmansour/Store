import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

// ignore: must_be_immutable
class EnterCoupon extends StatelessWidget {
  TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxStyle.withShadow,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(bottom: 30),

          children: <Widget>[
            Container(
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
                  'Enter Your Coupon Code!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: Roboto.bold,
                    fontSize: 24,
                    color: AppColors.first,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                margin:
                    EdgeInsets.only(top: 35, bottom: 40, left: 30, right: 30),
                decoration: BoxStyle.withShadow,
                child: TextField(
                  controller: couponController,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    new LengthLimitingTextInputFormatter(7),
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Center(
              child: FlatButton(
                onPressed: () {
                  if (couponController.text.length > 0) {
                    Navigator.pop(context, couponController.text);
                  }
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                  child: new Text(
                    'SUBMIT',
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
