import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/ui/HomeWidgets/cartWidgets/EditInfo.dart';

import '../../../Data.dart';

class Address extends StatefulWidget {
  final Function sendShopStep;
  final total;

  Address({Key key, this.sendShopStep, this.total}) : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  int selectedShipping = 0;

  List infos = ['John Doe', 'Zone 1 Tunisia', 4135,'Tunisia','+2164324232'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          child: Text(
            'Shipping Address',
            style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxStyle.withShadow,
          margin: EdgeInsets.only(
            top: 10,
            left: 20,
            right: 20,
          ),
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                child: Text(
                  infos[0],
                  style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                  padding: EdgeInsets.only(left: 10),
                  width: double.infinity,
                  child: Text(
                    'Adress:${infos[1]}',
                    style: TextStyle(
                        fontFamily: Roboto.regular
                    ),
                  )),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                width: double.infinity,
                child: Text(
                  'Zip code: ${infos[2].toString()}',
                  style: TextStyle(
                      fontFamily: Roboto.regular
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Container(color: Colors.grey, height: 1),
              Container(
                width: double.infinity,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => EditInfo(
                            fullName: infos[0],
                            adress: infos[1],
                            country: infos[3],
                            phone: infos[4],
                            zipCode: infos[2],
                          ),
                        )).then((value) {
                      if (value != null) {
                        setState(() {
                          infos[0] = value[0];
                          infos[1] = value[1];
                          infos[2] = int.parse(value[2]);
                        });
                      }
                    });
                  },
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Edit',
                    style: TextStyle(
                        fontFamily: Roboto.regular
                    ),
                    ),
                  )),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          child: Text(
            'Shipping Methods',
            style: TextStyle(fontFamily: Roboto.bold, fontSize: 16),
          ),
        ),
        Container(
          height: 120,
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: 10,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, position) {
              return InkWell(
                onTap: () {
                  setState(() {
                    selectedShipping = position;
                  });
                },
                child: Container(
                    margin: EdgeInsets.only(
                      right: (position == (Data.shippingMethods.length - 1)
                          ? 20
                          : 10),
                      left: (position == 0) ? 20 : 0,
                      top: 3,
                      bottom: 3,
                    ),
                    decoration: (selectedShipping != position)
                        ? BoxStyle.withoutShadow
                        : BoxStyle.withShadow,
                    child: Container(
                        child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        Data.shippingMethods[position].image,
                        fit: BoxFit.cover,
                        width: 120,
                        height: 120,
                      ),
                    ))),
              );
            },
            itemCount: Data.shippingMethods.length,
          ),
        ),
        Container(
          decoration: BoxStyle.withShadowAndRadiusTop,
          margin: EdgeInsets.only(
            top: 30,
            left: 20,
            right: 20,
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Delivery',
                    style: TextStyle(
                        fontFamily: Roboto.regular
                    ),
                  ),
                  Spacer(),
                  Text('15\$',
                  style: TextStyle(
                      fontFamily: Roboto.regular
                  ),)
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Order',
                    style: TextStyle(
                        fontFamily: Roboto.regular
                    ),
                  ),
                  Spacer(),
                  Text(widget.total.toStringAsFixed(2) + '\$',
                  style: TextStyle(
                      fontFamily: Roboto.regular
                  ),)
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxStyle.withShadowAndRadiusBottom,
          margin: EdgeInsets.only(
            top: 3,
            left: 20,
            right: 20,
          ),
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                  ),
                  Spacer(),
                  Text(
                    (widget.total + 15).toStringAsFixed(2) + '\$',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: Roboto.bold,
                        color: AppColors.first),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20),
          child: FlatButton(
            onPressed: () {
              setState(() {
                widget.sendShopStep(2);
              });
            },
            child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 15),
              child: new Text(
                'CONTINUE',
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
