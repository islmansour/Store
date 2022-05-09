import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
// ignore: must_be_immutable
class RefundDialog extends StatelessWidget {

  String image;
  var page;
  TextEditingController reasonController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationDuration: Duration(seconds: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),

      child: Container(
        decoration: BoxStyle.withoutShadow,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[


            Container(
              margin: EdgeInsets.all(10),

              decoration: BoxStyle.withShadow,

              child: TextField(


                controller: reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                    hintText: 'Give us a short description of the reason of refund'
                ),


              ),
            ),

            Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10),
                ),
                onPressed: (){
                  Navigator.pop(context,'Asked for refund');
                },
                color: AppColors.first,
                child: Text(
                  'Ask for Refund',

                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: Roboto.bold
                  ),
                ),
              ),
            )

          ],
        ),


      ),
    );
  }
}
