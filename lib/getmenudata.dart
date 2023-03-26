class GetMenuData {
  int? menuId;
  String? menuName;
  double? price;
  String? ingredients;

  GetMenuData({this.menuId, this.menuName, this.price, this.ingredients});
  factory GetMenuData.fromJson(Map<String, dynamic> json) {
    return GetMenuData(
        menuId: json['menuId'],
        menuName: json['menuName'],
        price: json['price'],
        ingredients: json['ingredients']);
  }
}
