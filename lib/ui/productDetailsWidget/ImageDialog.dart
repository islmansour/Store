import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ImageDialog extends StatelessWidget {

  String image;
  ImageDialog({this.image});
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Dialog(

      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        width: width-100,
        height: width-100,
        color: Colors.red,
        child: FadeInImage.assetNetwork(
          image: image,
          placeholder: "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
