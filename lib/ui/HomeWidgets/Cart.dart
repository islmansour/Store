import 'package:flutter/material.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/ui/HomeWidgets/cartWidgets/Address.dart';
import 'package:store/ui/HomeWidgets/cartWidgets/MyCart.dart';
import 'package:store/ui/HomeWidgets/cartWidgets/Payment.dart';


class Cart extends StatefulWidget {
  final Function function;

  Cart({Key key, this.function}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int shopStep = 0;

  num total = 0;

  final GlobalKey _myCartKey = GlobalKey();
  final GlobalKey _adressKey = GlobalKey();
  final GlobalKey _paymentKey = GlobalKey();

  void getTotal(num value) {
    setState(() {
      total = value;
    });
  }



  void getShopStep(int step) {
    setState(() {
      shopStep = step;

      //GO to top screen when clicking to CONTINUE
      lvController.animateTo(
        0.0,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  ScrollController lvController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> cartPages = [
      //My Cart

      MyCart(
        key: _myCartKey,
        sendShopStep: getShopStep,
        sendTotal: getTotal,
      ),

      //Adress
      Address(
        key: _adressKey,
        total: total,
        sendShopStep: getShopStep,
      ),

      //Payment
      Payment(
        key: _paymentKey,
      ),
    ];

    return Container(
      color: AppColors.third,
      child: ListView(
        controller: lvController,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'My Cart',
                      style: TextStyle(
                        fontSize: 10,
                        color: (shopStep >= 0) ? Colors.black : Colors.grey,
                        fontFamily: (shopStep >= 0)
                            ? Roboto.bold
                            : Roboto.regular,
                      ),
                    ),
                    InkWell(
                      onTap: (shopStep == 0)
                          ? null
                          : () {
                        setState(() {
                          shopStep = 0;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (shopStep >= 0)
                              ? AppColors.first
                              : Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        width: 100,
                        height: 7,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 10,
                        color: (shopStep >= 1) ? Colors.black : Colors.grey,
                        fontFamily: (shopStep >= 1)
                            ? Roboto.bold
                            : Roboto.regular,
                      ),
                    ),
                    InkWell(
                      onTap: (shopStep <= 1)
                          ? null
                          : () {
                        setState(() {
                          shopStep = 1;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: (shopStep >= 1)
                              ? AppColors.first
                              : Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        width: 100,
                        height: 7,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Text(
                      'Payment',
                      style: TextStyle(
                        fontSize: 10,
                        color: (shopStep == 2) ? Colors.black : Colors.grey,
                        fontFamily: (shopStep == 2)
                            ? Roboto.bold
                            : Roboto.regular,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: (shopStep == 2)
                            ? AppColors.first
                            : Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      margin: EdgeInsets.only(top: 5, bottom: 10),
                      width: 100,
                      height: 7,
                    ),
                  ],
                ),
              ],
            ),
          ),
          cartPages[shopStep]
        ],
      )
    );
  }
}
