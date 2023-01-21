import 'dart:ui';
import 'package:flutter/material.dart';

class Product {
  //members
  late String group, url, text, price;
  late Color primaryColor, textColor;

  //constructor
  Product({
    required this.group,
    required this.url,
    required this.text,
    required this.price,
    required this.primaryColor,
    required this.textColor,
  });

  Product.fromJson(json)
      : group = json["group"],
        url = json["url"],
        text = json["text"],
        price = json["price"];

  Map<String, dynamic> toJson() {
    return {'group': group, 'url': url, 'text': text, 'price': price};
  }
}
