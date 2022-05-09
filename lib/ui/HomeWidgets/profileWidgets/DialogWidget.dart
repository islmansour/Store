import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';

// ignore: must_be_immutable
class DialogWidget extends StatelessWidget {
  String value;

  DialogWidget({this.value});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController(text: value);
    return Dialog(
      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        decoration: BoxStyle.withShadow,
        width: double.infinity,
        child: ListView(
          padding: EdgeInsets.only(bottom: 30),
          shrinkWrap: true,
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
              child: Container(
                margin:
                    EdgeInsets.only(top: 20, bottom: 40, left: 30, right: 30),
                decoration: BoxStyle.withShadow,
                child: TextField(
                  controller: controller,
                  autofocus: true,
                  textAlign: TextAlign.center,
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
                  Navigator.pop(context, controller.text);
                },
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 15, left: 40, right: 40),
                  child: new Text(
                    'EDIT',
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
