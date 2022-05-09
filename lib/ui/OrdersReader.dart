import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/ui/OrderDetails.dart';

import '../Data.dart';

class OrdersReader extends StatefulWidget {
  @override
  _OrdersReaderState createState() => _OrdersReaderState();
}

class _OrdersReaderState extends State<OrdersReader> {
  List pList = Data.orders;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.first,
        title: Text(
          'Orders History',
          style: TextStyle(color: Colors.black,
          fontFamily: Roboto.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: (pList.length==0)?Center(
        child: Text(
          'No Orders found',
          style: TextStyle(
            fontFamily: Roboto.medium,
            fontSize: 18,

          ),
        ),

      )  : RefreshIndicator(
        onRefresh: () async{
          //TODO: UPDATE YOUR DATA
          await Future.delayed(Duration(milliseconds: 700));
          setState(() {

          });
        },
        child: Container(
          color: AppColors.third,
          height: double.infinity,
          child: ListView.builder(
            itemBuilder: (context, position) {
              return Container(
                width: width,
                margin: EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                    bottom: (position==(pList.length-1))? 10 : 0
                ),
                decoration: BoxStyle.withoutShadow,
                child: Wrap(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 15),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                'Order №${pList[position].id}',
                                style: TextStyle(
                                    fontFamily: Roboto.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Spacer(),
                              Text(pList[position].date,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Roboto.regular,
                                    fontSize: 16),)
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(5)),
                          Row(
                            children: <Widget>[
                              Text('Tracking number:  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: Roboto.regular),),
                              Text(
                                pList[position].tracking_number,
                                style: TextStyle(
                                    fontFamily: Roboto.regular,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Row(
                            children: <Widget>[
                              Text('Quantity:  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Roboto.regular,
                                    fontSize: 16),),
                              Text(
                                pList[position].quantity.toString(),
                                style: TextStyle(
                                    fontFamily: Roboto.bold,
                                    color: Colors.black,
                                    fontSize: 16),
                              ),
                              Spacer(),
                              Text('Total Amount:  ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: Roboto.regular,
                                    fontSize: 16),),
                              Text(
                                pList[position].price.toString() + '\$',
                                style: TextStyle(
                                    fontFamily: Roboto.bold,
                                    color: AppColors.first,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.all(3)),
                          Row(
                            children: <Widget>[
                              FlatButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                    side: BorderSide(
                                        color: AppColors.first, width: 2)),
                                onPressed: () {

                                  Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => OrderDetails(

                                            order:pList[position]
                                        ),
                                      ));
                                },
                                child: Text('Details',
                                  style: TextStyle(
                                      fontFamily: Roboto.regular
                                  ),),
                              ),
                              Spacer(),
                              Text(
                                pList[position].status,
                                style: TextStyle(
                                    fontFamily: Roboto.bold,
                                    color: (pList[position].status == 'Delivered')
                                        ? Colors.green
                                        : Colors.orange,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

              );
            },
            itemCount: pList.length,
          ),
        ),
      ),
    );
  }
}
