
class ProductModel {
  ProductModel({
    this.title,

    this.price,
    this.discountPercentage,
    this.rating,
    this.thumbnail,});

  ProductModel.fromJson(dynamic json) {

    title = json['title'];

    price = json['price'];
    discountPercentage = json['discountPercentage'];
    rating = json['rating'];

    thumbnail = json['thumbnail'];
  }
  String? title;
  num? price;
  num? discountPercentage;
  num? rating;
  String? thumbnail;

}