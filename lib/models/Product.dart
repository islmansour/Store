class Product {
  String id;
  String name;
  String desc;
  String alias;
  String createdBy;
  String img;
  String category;
  String subCategory;
  double price;
  double discount;
  DateTime created;
  bool active;

  Product(
      {this.id,
      this.name,
      this.desc,
      this.alias,
      this.category,
      this.subCategory,
      this.img,
      this.createdBy,
      this.active,
      this.price,
      this.discount,
      this.created});
}
