import 'package:flutter/material.dart';
import 'package:store/Styles/BoxStyle.dart';
import 'package:store/colors/AppColors.dart';
import 'package:store/fonts/Roboto.dart';
import 'package:store/models/Order.dart';
import 'package:store/ui/ordersWidgets/RefundDialog.dart';

// ignore: must_be_immutable
class OrderDetails extends StatefulWidget {

  Order order;

  OrderDetails({this.order});

  @override
  _OrderDetailsState createState() => _OrderDetailsState(
    order:order
  );
}

class _OrderDetailsState extends State<OrderDetails> {


  Order order;
  _OrderDetailsState({this.order});





  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.first,
        title: Text(
          'Order Details',
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
      body: Container(
        color: AppColors.third,
        height: height,
        width: width,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Order №${order.id}',
                  style: TextStyle(
                      fontFamily: Roboto.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
                Spacer(),
                Text(order.date,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: Roboto.regular,
                      fontSize: 16),
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top:10),
            child: Row(
              children: <Widget>[
                Text('Tracking number:  ',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: Roboto.regular
                  ),),
                Text(
                  order.tracking_number,
                  style: TextStyle(
                      fontFamily: Roboto.bold,
                      color: Colors.black,
                      fontSize: 16),
                ),
                Spacer(),
                Text(
                  order.status,
                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                      fontFamily: Roboto.bold,
                      color: (order.status == 'Delivered')
                          ? Colors.green
                          : Colors.orange,
                      fontSize: 16),
                ),

              ],
            ),
            ),

            Padding(padding: EdgeInsets.only(top:10),
            child: Text(
              '${order.quantity} items',

              style: TextStyle(
                  fontFamily: Roboto.bold,
                  color: Colors.black,
                  fontSize: 16),
            ),),

            Padding(

              padding: EdgeInsets.only(
                top: 10,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (context, position) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxStyle.withShadow,
                      child: Row(
                        children: <Widget>[
                          Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: FadeInImage.assetNetwork(
                                  image: order.articles[position].image[0],
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
                                          width: width -200,
                                          child: Text(
                                            order.articles[position].title,
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                                fontSize: 18,
                                                fontFamily: Roboto.bold
                                            ),
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
                                            order.articles[position].label,
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
                                    Container(
                                      width: double.infinity,
                                      child:Text(
                                        'Quantity : ${order.articles[position].quatity}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: Roboto.medium
                                        ),
                                      ) ,
                                    ),
                                    Spacer(),
                                    Row(
                                      children: <Widget>[
                                        Spacer(),
                                        Container(
                                          child: Text(
                                            order.articles[position].price.toString() +
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
                  );
                },
                itemCount: order.articles.length,
                physics: NeverScrollableScrollPhysics(),
              ),
            ),


            Padding(
              padding: EdgeInsets.only(
                  top: 10,
                  bottom: 5
              ),
              child: Text(
                'Order Information',

                style: TextStyle(
                    fontFamily: Roboto.bold,
                    color: Colors.black,
                    fontSize: 16),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: 5
              ),
              child:Row(

                children: <Widget>[
                  Text(
                    'Shipping Address: ',

                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Roboto.regular,
                        fontSize: 16),
                  ),

                  Text(
                    order.shippingAddress,

                    style: TextStyle(
                        fontFamily: Roboto.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ],
              ) ,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: 10
              ),
              child:Row(

                children: <Widget>[
                  Text(
                    'Payment Method: ',

                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Roboto.regular,
                        fontSize: 16),
                  ),

                  Text(
                    order.paymentMethod,

                    style: TextStyle(
                        fontFamily: Roboto.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ],
              ) ,
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: 10
              ),
              child:Row(

                children: <Widget>[
                  Text(
                    'Shipping Method:',

                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Roboto.regular,
                        fontSize: 16),
                  ),

                  Text(
                    ' '+order.deliveryMethod,

                    style: TextStyle(
                        fontFamily: Roboto.bold,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                ],
              ) ,
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: 10
              ),
              child:Row(

                children: <Widget>[
                  Text(
                    'Total Amount:       ',

                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: Roboto.regular,
                        fontSize: 16),
                  ),

                  Text(
                    order.price.toString()+'\$',

                    style: TextStyle(
                        fontFamily: Roboto.bold,
                        color: AppColors.first,
                        fontSize: 16),
                  ),
                ],
              ) ,
            ),

            Padding(padding: EdgeInsets.only(top:10),
            child: Row(
              children: <Widget>[
                Spacer(),
                FlatButton(
                  color: Colors.red,
                  onPressed: (order.status=='Asked for refund')? null :(){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return RefundDialog();
                      },
                    ).then((onValue){
                      if(onValue!=null){

                        setState(() {
                          order.status=onValue.toString();
                        });
                      }
                    });


                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5
                    ),
                    child: Text(
                      'Refund',
                      style: TextStyle(
                          color:(order.status=='Asked for refund')? Colors.grey: Colors.white,
                          fontSize: 16,
                          fontFamily: Roboto.medium
                      ),
                    ),
                  ),
                ),
                Spacer(),
                FlatButton(
                  color: Colors.green,
                  onPressed: (){

                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10,
                        right: 10,
                        top: 5,
                        bottom: 5
                    ),
                    child: Text(
                      ' Track ',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: Roboto.medium
                      ),
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            ),


          ],
        ),
      ),
    );
  }
}

