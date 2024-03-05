import 'dart:convert';


class Products {
  num id;
  String title;
  String description;
  num price;
  num discountPercentage;
  num rating;
  int stock;
  String brand;
  String category;
  String thumbnail;
  List<String> images;
  Products({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'brand': brand,
      'category': category,
      'thumbnail': thumbnail,
      'images': images,
    };
  }

  factory Products.fromMap(Map<String, dynamic> map) {
    return Products(
        id: map['id'] as num,
        title: map['title'] as String,
        description: map['description'] as String,
        price: map['price'] as num,
        discountPercentage: map['discountPercentage'] as num,
        rating: map['rating'] as num,
        stock: map['stock'] as int,
        brand: map['brand'] as String,
        category: map['category'] as String,
        thumbnail: map['thumbnail'] as String,
        images: List<String>.from((map['images'] as List<dynamic>),
        ));
  }

  String toJson() => json.encode(toMap());

  factory Products.fromJson(String source) => Products.fromMap(json.decode(source) as Map<String, dynamic>);
}