class GetMenuData {
  int? menuId;
  String? menuName;
  double? price;
  String? ingredients;
  int? cookId;

  GetMenuData(
      {this.menuId, this.menuName, this.price, this.ingredients, this.cookId});
  factory GetMenuData.fromJson(Map<String, dynamic> json) {
    return GetMenuData(
        menuId: json['menuId'],
        menuName: json['menuName'],
        price: json['price'],
        ingredients: json['ingredients'],
        cookId: json['cook']);
  }
}
