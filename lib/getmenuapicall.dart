import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'getmenudata.dart';

int? foodId;
String? foodTitle;
double? foodPrice;
String? foodIngredients;
Future<void> getmenu() async {
  try {
    Response response = await get(
        Uri.parse('https://ofopapi.azurewebsites.net/api/Menu/getMenuByMenuID'),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        });
    var body = response.body;
    GetMenuData data = GetMenuData.fromJson(jsonDecode(body));
    foodId = data.menuId;
    foodTitle = data.menuName.toString();
    foodPrice = data.price;
    foodIngredients = data.ingredients.toString();
    print(response.statusCode);
    print(body);
  } catch (e) {
    print(e.toString());
  }
}
