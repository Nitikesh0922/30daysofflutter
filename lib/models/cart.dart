// ignore_for_file: unnecessary_null_comparison

import 'package:flutter_catalog/models/catalog.dart';

class CartModel {
  static final crtModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => crtModel;

  //catalog fields
  late CatalogModel _catalog;

  //collection of ids - store ids of each item
  final List<int> _itemIds = [];

  // get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);

    _catalog = newCatalog;
  }

  //get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add items
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove Items
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
