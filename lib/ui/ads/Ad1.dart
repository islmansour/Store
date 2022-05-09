import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/models/Ad.dart';

// ignore: must_be_immutable
class Ad1 extends StatelessWidget {
  Ad ad;

  Ad1({this.ad});
  @override
  Widget build(BuildContext context) {

    double screenWidth=double.parse(MediaQuery.of(context).size.width.toString());

    return Dialog(

      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child:  Container(
        height: screenWidth,
        decoration: BoxStyle.withoutShadow,

        child: Stack(

          children: <Widget>[

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage.assetNetwork(
                image: ad.image,
                placeholder: '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),

            Positioned(
              bottom: 20,
              child: Container(
                width: screenWidth-80,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20
                        ),
                        child: Text(
                          ad.title,
                          style: TextStyle(
                              fontFamily: Roboto.bold,
                              fontSize: 35,
                              color: Colors.white
                          ),
                        ),
                      ),


                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10
                        ),
                        child: Text(
                          ad.subtitle,
                          style: TextStyle(
                              fontFamily: Roboto.medium,
                              fontSize: 20,
                              color: Colors.white
                          ),
                        ),
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(10),
                        ),
                        onPressed:ad.action,
                        color: AppColors.first,
                        child: Text(
                          ad.buttonText,
                          style: TextStyle(
                              fontFamily: Roboto.medium,
                              color: Colors.black,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ],
                  ),

                ),
              ),
            ),


            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: Icon(Icons.clear, color: Colors.white,),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
