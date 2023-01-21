/*
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ui';
import 'package:sneak_crib/core/widgets/product.dart';

//class for project data
class Repository {
  ///we have raw products - all products
  ///product groups - categorizing products into groups eg. blue, yellow shoe groups etc
  ///products in a group - same group products list
  ///first product in a group - to show to home page

//first product in a group
  Product firstProductInGroup(String group) {
    return productsInGroup(group).first;
  }

  //products in groups
  List<Product> productsInGroup(String group) {
    List<Product> products = [];
    for (Product _product in rawProducts()) {
      if (_product.group == group) {
        products.add(_product);
      }
    }
    return products;
  }

  //products groups a list of group names
  // List<String> productGroups() {
  //   Set<String> groups = {};
  //   for (Product _product in rawProducts()) {
  //     groups.add(_product.group);
    }
    return groups.toList();
  // }
  //
  //raw products
  List<Product> rawProducts() {
    List<Product> products = [];

    //yellow
    products.add(Product());
    products.add(Product(
      url: "assets/products/yellow2.png",
    ));
    products.add(Product(
      url: "assets/products/yellow3.png",
    ));
    products.add(Product(
      url: "assets/products/yellow4.png",
    ));
    products.add(Product(
      url: "assets/products/yellow5.png",
    ));
    products.add(Product(
      url: "assets/products/yellow6.png",
    ));

    //blue
    products.add(Product(
        group: "blue",
        url: "assets/products/blue1.png",
        primaryColor: const Color(0xff927bd5)));
    products.add(Product(
        group: "blue",
        url: "assets/products/blue2.png",
        primaryColor: const Color(0xff927bd5)));
    products.add(Product(
        group: "blue",
        url: "assets/products/blue3.png",
        primaryColor: const Color(0xff927bd5)));
    products.add(Product(
        group: "blue",
        url: "assets/products/blue4.png",
        primaryColor: const Color(0xff927bd5)));

    //black
    products.add(Product(
        group: "black",
        url: "assets/products/black1.png",
        primaryColor: const Color(0xffde304a)));
    products.add(Product(
        group: "black",
        url: "assets/products/black2.png",
        primaryColor: const Color(0xffde304a)));
    products.add(Product(
        group: "black",
        url: "assets/products/black3.png",
        primaryColor: const Color(0xffde304a)));
    products.add(Product(
        group: "black",
        url: "assets/products/black4.png",
        primaryColor: const Color(0xffde304a)));
    products.add(Product(
        group: "black",
        url: "assets/products/black5.png",
        primaryColor: const Color(0xffde304a)));

    //grey
    products.add(Product(
        group: "grey",
        url: "assets/products/grey1.png",
        primaryColor: const Color(0xff8e8b89)));
    products.add(Product(
        group: "grey",
        url: "assets/products/grey2.png",
        primaryColor: const Color(0xff8e8b89)));
    products.add(Product(
        group: "grey",
        url: "assets/products/grey3.png",
        primaryColor: const Color(0xff8e8b89)));
    products.add(Product(
        group: "grey",
        url: "assets/products/grey4.png",
        primaryColor: const Color(0xff8e8b89)));

    return products;
  }
}
*/
