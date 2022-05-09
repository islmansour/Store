import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/main.dart';
import 'package:store/models/Article.dart';

import '../../../Data.dart';
import 'EnterCoupon.dart';
import 'ReceiveCoupon.dart';

class MyCart extends StatefulWidget {
  final Function sendShopStep;
  final Function sendTotal;

  MyCart({Key key, this.sendShopStep, this.sendTotal}) : super(key: key);

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  String couponCode = 'XYZWERF';

  List<Article> cartitems = cartArticles;

  void updateCode(String code) {
    setState(() => couponCode = code);
  }

  int couponValue = 50;
  List<double> sums = [];

  @override
  void initState() {
    // TODO: implement initState

    for (int i = 0; i < cartitems.length; i++) {
      print(cartitems[i].quatity);
      sums.add(cartitems[i].price * cartitems[i].quatity);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth =
        double.parse(MediaQuery.of(context).size.width.toString());
    return (cartArticles.length == 0)
        ? Center(
            child: Image.asset(
              'images/emptyCart.png',
              width: screenWidth * 0.5,
              height: screenWidth * 0.5,
            ),
          )
        : Column(
            children: <Widget>[
              Container(
                decoration: BoxStyle.withShadow,
                margin: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: AppColors.first)),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ReceiveCoupon(coupon: couponCode, value: 100);
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.first,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Icon(
                              Icons.local_offer,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text(
                            'You wan\'t a coupon?',
                            style: TextStyle(fontFamily: Roboto.regular),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 20),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, position) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxStyle.withShadowAndRadiusTop,
                            child: Row(
                              children: <Widget>[
                                Container(
                                    child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: FadeInImage.assetNetwork(
                                    //image:Exemples.discount[position].image,
                                    image: cartitems[position].image[0],
                                    placeholder: '',
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 100,
                                  ),
                                )),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 100,
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: screenWidth - 200,
                                            child: Text(
                                              cartitems[position].title,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: Roboto.bold),
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top: 3,
                                            ),
                                            child: Text(
                                              Data.articles[position].label,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: Roboto.medium,
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          Spacer()
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Container(
                                            width: 25,
                                            height: 25,
                                            margin: EdgeInsets.only(
                                                top: 5, right: 3),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 1.0,
                                                  // has the effect of softening the shadow
                                                  spreadRadius: 1.0,
                                                  // has the effect of extending the shadow
                                                  offset: Offset(
                                                    0,
                                                    // horizontal, move right 10
                                                    1, // vertical, move down 10
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  cartitems[position].quatity++;
                                                  sums[position] =
                                                      cartitems[position]
                                                              .quatity *
                                                          cartitems[position]
                                                              .price;
                                                });
                                              },
                                              child: Icon(Icons.add),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                                top: 3,
                                                bottom: 3),
                                            child: Text(
                                              cartitems[position]
                                                  .quatity
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: Roboto.bold),
                                            ),
                                          ),
                                          Container(
                                            width: 25,
                                            height: 25,
                                            margin: EdgeInsets.all(3),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 1.0,
                                                  // has the effect of softening the shadow
                                                  spreadRadius: 1.0,
                                                  // has the effect of extending the shadow
                                                  offset: Offset(
                                                    0,
                                                    // horizontal, move right 10
                                                    1, // vertical, move down 10
                                                  ),
                                                )
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (cartitems[position]
                                                          .quatity !=
                                                      1) {
                                                    cartitems[position]
                                                        .quatity--;
                                                    sums[position] =
                                                        cartitems[position]
                                                                .quatity *
                                                            cartitems[position]
                                                                .price;
                                                  }
                                                });
                                              },
                                              child: Icon(Icons.remove),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: <Widget>[
                                          Spacer(),
                                          Container(
                                            child: Text(
                                              cartitems[position]
                                                      .price
                                                      .toString() +
                                                  '\$',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: Roboto.medium,
                                                  color: AppColors.first),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                          Container(color: Colors.grey, height: 1),
                          Container(
                            decoration: BoxStyle.withShadowAndRadiusBottom,
                            width: double.infinity,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  cartArticles[position].quatity = 0;
                                  cartitems.removeAt(position);
                                  sums.removeAt(position);
                                  // cartlen--;
                                });
                              },
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  'Remove',
                                  style: TextStyle(fontFamily: Roboto.medium),
                                ),
                              )),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: cartitems.length,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              Container(
                decoration: BoxStyle.withShadow,
                margin: EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Material(
                  shadowColor: Colors.transparent,
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                      side: BorderSide(color: AppColors.first)),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EnterCoupon();
                        },
                      ).then((onValue) {
                        if (onValue != null) {
                          setState(() {
                            couponCode = onValue.toString().toUpperCase();
                          });
                        }
                      });
                      print('Hi');
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.first,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Icon(
                              Icons.local_offer,
                              color: Colors.white,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(5),
                          ),
                          Text(
                            'You have a coupon code?',
                            style: TextStyle(fontFamily: Roboto.medium),
                          ),
                          Spacer(),
                          Icon(
                            Icons.navigate_next,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxStyle.withShadowAndRadiusTop,
                margin: EdgeInsets.only(
                  top: 10,
                  left: 20,
                  right: 20,
                ),
                padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, position) {
                          return Row(
                            children: <Widget>[
                              Container(
                                width: screenWidth - 200,
                                child: Text(
                                  cartitems[position].title,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontFamily: Roboto.regular),
                                ),
                              ),
                              Spacer(),
                              Text(
                                sums[position].toStringAsFixed(2) + '\$',
                                style: TextStyle(fontFamily: Roboto.regular),
                              ),
                            ],
                          );
                        },
                        itemCount: sums.length,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Coupon',
                          style: TextStyle(fontFamily: Roboto.regular),
                        ),
                        Spacer(),
                        Text(
                          '-$couponValue\$',
                          style: TextStyle(fontFamily: Roboto.regular),
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
                          style:
                              TextStyle(fontSize: 16, fontFamily: Roboto.bold),
                        ),
                        Spacer(),
                        Text(
                          (sums.length == 0)
                              ? '0\$'
                              : ((sums.reduce((value, element) =>
                                              value + element) -
                                          couponValue) <
                                      0)
                                  ? '0\$'
                                  : (sums.reduce((value, element) =>
                                                  value + element) -
                                              couponValue)
                                          .toStringAsFixed(2) +
                                      '\$',
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
                margin:
                    EdgeInsets.only(left: 70, right: 70, top: 20, bottom: 20),
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.sendShopStep(1);
                      widget.sendTotal((sums.length == 0)
                          ? 0
                          : double.parse(((sums.reduce(
                                          (value, element) => value + element) -
                                      couponValue) <
                                  0)
                              ? 0
                              : (sums.reduce(
                                          (value, element) => value + element) -
                                      couponValue)
                                  .toStringAsFixed(2)));
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
