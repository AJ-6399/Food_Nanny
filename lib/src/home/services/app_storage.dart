import 'dart:developer';

import 'package:get_storage/get_storage.dart';

import '../models/item_model.dart';

class AppStorage {
  AppStorage._privateConstructor();

  static final _box = GetStorage();

  static Future setAllItems(List<Item> items) async {
    log('setAllItems');
    await _box.write(AppStorageKeys.items, items);
  }

  static Future<List> getAllItems() async {
    log('getAllItems');
    return await _box.read(AppStorageKeys.items) ?? [];
  }

  static Future setAllOrders(List<String> orders) async {
    log('setAllOrders');
    await _box.write(AppStorageKeys.orders, orders);
  }

  static Future<List> getAllOrders() async {
    log('getAllOrders');
    return await _box.read(AppStorageKeys.orders) ?? [];
  }
}

class AppStorageKeys {
  static const String items = 'items';
  static const String orders = 'orders';
}
