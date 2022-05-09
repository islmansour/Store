import 'package:store/models/Article.dart';

class Order{

  String id;
  String date;
  // ignore: non_constant_identifier_names
  String tracking_number;
  int quantity;
  int price;
  List<Article> articles;
  String shippingAddress;
  String paymentMethod;
  String deliveryMethod;
  String status;
  Order({
    this.id,
    this.date,
    // ignore: non_constant_identifier_names
    this.tracking_number,
    this.quantity,
    this.price,
    this.articles,
    this.shippingAddress,
    this.paymentMethod,
    this.deliveryMethod,
    this.status,
});

}