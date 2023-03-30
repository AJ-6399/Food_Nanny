import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../models/item_model.dart';
import '../services/app_storage.dart';

class HomeController extends GetxController {
  final nameTextCtrl = TextEditingController();
  final catTextCtrl = TextEditingController();
  final indTextCtrl = TextEditingController();
  final priceTextCtrl = TextEditingController();
  final imageTextCtrl = TextEditingController();

  final itemsList = <Item>[].obs;
  final ordersList = <Item>[].obs;
  final ordersIdList = <String>[].obs;
  final imageFile = XFile('').obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    var itemsData = await AppStorage.getAllItems();
    var ordersData = await AppStorage.getAllOrders();

    log('itemsData : $itemsData');
    log('ordersData : $ordersData');

    for (var item in itemsData) {
      itemsList.add(Item.fromJson(item));
    }
    for (var item in ordersData) {
      ordersIdList.add(item);
    }
    updateOrdersList();
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      imageFile(image);
    } on PlatformException catch (e) {
      Get.rawSnackbar(message: 'Failed to pick image');
      print('Failed to pick image: $e');
    }
  }

  void addItem() async {
    var newItem = Item(
      id: Uuid().v4(),
      name: nameTextCtrl.text,
      category: catTextCtrl.text,
      ingredient: indTextCtrl.text,
      price: priceTextCtrl.text,
      image: imageFile.value.path,
      count: 0,
    );
    log(newItem.toJson().toString());
    itemsList.add(newItem);
    try {
      await AppStorage.setAllItems(itemsList);
    } catch (e) {
      log('$e');
    }
    clearForm();
    Get.back();
  }

  void addToOrders(Item item, bool value) async {
    if (value) {
      ordersIdList.add(item.id!);
      log('Item added');
    } else {
      ordersIdList.removeWhere((data) => data == item.id!);
      log('Item removed');
    }

    updateOrdersList();

    try {
      await AppStorage.setAllOrders(ordersIdList);
    } catch (e) {
      log('$e');
    }
  }

  void updateOrdersList() {
    ordersList.clear();
    for (var id in ordersIdList) {
      var item = itemsList.firstWhere((item) => item.id == id);
      ordersList.add(item);
    }
  }

  void updateCounter(bool isInc, Item order) async {
    var item = itemsList.firstWhere((element) => element.id == order.id);
    var index = itemsList.indexWhere((element) => element.id == order.id);

    isInc ? item.count++ : item.count--;

    itemsList.removeAt(index);
    itemsList.insert(index, item);

    try {
      await AppStorage.setAllItems(itemsList);
    } catch (e) {
      log('$e');
    }

    updateOrdersList();
  }

  void clearForm() {
    nameTextCtrl.clear();
    catTextCtrl.clear();
    indTextCtrl.clear();
    priceTextCtrl.clear();
    imageFile(XFile(''));
  }
}
