class Product {
  int? id;
  String? title;
  String? description;
  int? marketPrice;
  int? sellingPrice;
  String? image;
  String? created;
  Category? category;
  bool? favourite;

  Product(
      {this.id,
        this.title,
        this.description,
        this.marketPrice,
        this.sellingPrice,
        this.image,
        this.created,
        this.category,
        this.favourite});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    marketPrice = json['marketPrice'];
    sellingPrice = json['sellingPrice'];
    image = json['image'];
    created = json['created'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['marketPrice'] = this.marketPrice;
    data['sellingPrice'] = this.sellingPrice;
    data['image'] = this.image;
    data['created'] = this.created;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['favourite'] = this.favourite;
    return data;
  }
}

class Category {
  int? id;
  String? title;
  String? created;

  Category({this.id, this.title, this.created});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['created'] = this.created;
    return data;
  }
}
