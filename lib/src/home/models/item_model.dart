class Item {
  String? id;
  String? name;
  String? category;
  String? ingredient;
  String? price;
  String? image;
  late int count;

  Item({
    this.id,
    this.name,
    this.category,
    this.ingredient,
    this.price,
    this.image,
    this.count = 0,
  });

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    ingredient = json['ingredient'];
    price = json['price'];
    image = json['image'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['category'] = this.category;
    data['ingredient'] = this.ingredient;
    data['price'] = this.price;
    data['image'] = this.image;
    data['count'] = this.count;
    return data;
  }

  Item copyWith({
    String? id,
    String? name,
    String? category,
    String? ingredient,
    String? price,
    String? image,
    int? count,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      ingredient: ingredient ?? this.ingredient,
      price: price ?? this.price,
      image: image ?? this.image,
      count: count ?? this.count,
    );
  }
}
