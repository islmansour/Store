import 'package:flutter/material.dart';

class BoxStyle {
  static BoxDecoration withShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Color(0xFFDCDCDC),
        blurRadius: 1.0,
        // has the effect of softening the shadow
        spreadRadius: 1.0,
        // has the effect of extending the shadow
        offset: Offset(
          0, // horizontal, move right 10
          1, // vertical, move down 10
        ),
      )
    ],
  );

  static BoxDecoration withoutShadow = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
  );


  static BoxDecoration withShadowAndRadiusBottom=BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Color(0xFFDCDCDC),
        blurRadius: 1.0,
        // has the effect of softening the shadow
        spreadRadius: 1.0,
        // has the effect of extending the shadow
        offset: Offset(
          0, // horizontal, move right 10
          1, // vertical, move down 10
        ),
      )
    ],
  );

  static BoxDecoration withShadowAndRadiusTop=BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Color(0xFFDCDCDC),
        blurRadius: 1.0,
        // has the effect of softening the shadow
        spreadRadius: 1.0,
        // has the effect of extending the shadow
        offset: Offset(
          0, // horizontal, move right 10
          1, // vertical, move down 10
        ),
      )
    ],
  );
}
