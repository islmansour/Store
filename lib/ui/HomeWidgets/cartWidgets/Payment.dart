import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/functions/CardMonthInputFormatter.dart';
import 'package:store/functions/CardNumberInputFormatter.dart';
import 'package:store/transitions/ScaleRoute.dart';
import 'package:store/ui/HomeWidgets/cartWidgets/ShoppingDone.dart';

import '../../../Data.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController exController = TextEditingController();

  int selectPayment = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 100,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 20,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectPayment = position;
                  });
                },
                child: Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      right: (position == (Data.paymentMethods.length - 1)
                          ? 20
                          : 10),
                      left: (position == 0) ? 20 : 0,
                      top: 3,
                      bottom: 3,
                    ),
                    decoration: (selectPayment != position)
                        ? BoxStyle.withoutShadow
                        : BoxStyle.withShadow,
                    child: Container(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        Data.paymentMethods[position].image,
                        fit: BoxFit.cover,
                        width: 70,
                        height: 70,
                      ),
                    ))),
              );
            },
            itemCount: Data.paymentMethods.length,
          ),
        ),
        (selectPayment == 2)
            ? Container()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      'Card Name',
                      style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    decoration: BoxStyle.withShadow,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'John Doe',
                        contentPadding: EdgeInsets.only(left: 20),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                    ),
                    child: Text(
                      'Card Number',
                      style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
                    ),
                  ),
                  Container(
                    decoration: BoxStyle.withShadow,
                    margin: EdgeInsets.only(
                        left: 20, right: 20, top: 10, bottom: 10),
                    child: TextFormField(
/*                       inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                        new LengthLimitingTextInputFormatter(16),
                        new CardNumberInputFormatter()
                      ], */
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '0000 0000 0000 0000',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    child: Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                'Expiry Date',
                                style: TextStyle(
                                    fontFamily: Roboto.bold, fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 100,
                              decoration: BoxStyle.withShadow,
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 10),
                              child: TextField(
                                controller: exController,
/*                           inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter()
                          ], */
                                keyboardType: TextInputType.number,
                                onChanged: (d) {},
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  hintText: 'MM/YY',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(3),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              child: Text(
                                'CVV         ',
                                style: TextStyle(
                                    fontFamily: Roboto.bold, fontSize: 16),
                              ),
                            ),
                            Container(
                              width: 100,
                              decoration: BoxStyle.withShadow,
                              margin: EdgeInsets.only(
                                  left: 20, right: 20, top: 5, bottom: 10),
                              child: TextField(
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(3),
                                ],
                                textAlign: TextAlign.center,
                                obscureText: true,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: '123',
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(
              left: 70,
              right: 70,
              bottom: 20,
              top: (selectPayment == 2) ? 50 : 0),
          child: FlatButton(
            onPressed: () {
              if (selectPayment == 2) {
                //TODO: Apply your paypal payment

              } else {
                Navigator.push(context, ScaleRoute(page: ShoppingDone()));
              }
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: new Text(
                (selectPayment == 2) ? 'PAY WITH PAYPAL' : 'CHECKOUT',
                style: new TextStyle(fontFamily: Roboto.bold),
              ),
            ),
            color: AppColors.first,
            shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5),
            ),
          ),
        )
      ],
    );
  }
}
