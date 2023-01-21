// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ui';
import 'package:sneak_crib/core/models/product.dart';

//class for project data
class Repository {
  ///we have raw products - all products
  ///product groups - categorizing products into groups eg. blue, yellow shoe groups etc
  ///products in a group - same group products list
  ///first product in a group - to show to home page

/*//first product in a group
  Product firstProductInGroup(String group) {
    return productsInGroup(group).first;
  }*/

  /*//products in groups
  List<Product> productsInGroup(String group) {
    List<Product> products = [];
    for (Product _product in rawProducts()) {
      if (_product.group == group) {
        products.add(_product);
      }
    }
    return products;
  }
*/
/*  //products groups a list of group names
  List<String> productGroups() {
    Set<String> groups = {};
    for (Product _product in productList()) {
      groups.add(_product.group);
    }
    return groups.toList();
  }*/
}
