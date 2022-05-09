import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';


class ShoppingDone extends StatelessWidget {





  @override
  Widget build(BuildContext context) {

    double screenWidth=MediaQuery.of(context).size.width;
    double screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(

      body: Stack(
        children: <Widget>[


          FadeInImage(
            image: AssetImage('images/shoppingDone.jpg'),
            placeholder: AssetImage(""),
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          Positioned(
            bottom: 0,
            child: Container(
              width: screenWidth-20,
              padding: EdgeInsets.only(
                bottom: 20,
                top: 20

              ),
              margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                bottom: 10
              ),
              decoration: BoxStyle.withShadow,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[

                  Text('All Done!',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: Roboto.bold,
                        fontSize: 0.05*screenHeight,
                        color: AppColors.first,

                    ),
                  ),

                  Padding(padding: EdgeInsets.all(15),),


                  Text('Your order will be delivered soon. \n'
                      'Thank you for choosing our app!',

                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: Roboto.medium,
                        fontWeight: FontWeight.w500,
                        fontSize: 0.03*screenHeight,
                        color: Colors.black,

                    ),
                  ),

                  Padding(padding: EdgeInsets.all(15),),

                  FlatButton(
                    color: AppColors.first,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10),
                    ),
                    onPressed: (){
                      Navigator.pop(context);

                    },
                    padding: EdgeInsets.only(
                        top: 15,
                        bottom: 15,
                        left: 30,
                        right: 30
                    ),
                    child:Text('Continue Shopping',
                      style: TextStyle(
                          fontFamily: Roboto.bold,
                          fontWeight: FontWeight.w500,
                          fontSize: 0.024*screenHeight,
                          color: Colors.black
                      ),),
                  ),
                ],

              ),
            ),
          )

        ],
      ),
    );
  }
}
