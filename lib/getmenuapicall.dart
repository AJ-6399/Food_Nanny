import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'getmenudata.dart';

int foodId = 1;
String? foodTitle;
String? foodPrice;
String? foodIngredients;
Future<void> getmenu() async {
  Response response = await post(
      Uri.parse(
        'https://ofopapi.azurewebsites.net/api/Menu/getAllMenuByCookID',
      ),
      body: jsonEncode({foodId}),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      });
  var body = response.body;
  GetMenuData data = GetMenuData.fromJson(jsonDecode(body));
  foodId = data.menuId!;
  foodTitle = data.menuName.toString();

  foodIngredients = data.ingredients.toString();
  print(response.statusCode);
  print(body);
  print(foodTitle);
}
