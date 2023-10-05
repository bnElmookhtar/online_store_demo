class ProductModel {
  int? id;
  String? title;
  double? price;
  String? description;

  String? category;
  String? image;
  bool isFavorite;
  ProductModel(
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.isFavorite,
  );

  factory ProductModel.jsonMap(Map<String, dynamic> json, bool isFavorite) {
    return ProductModel(
      json["id"],
      json["title"],
      json["price"],
      json["description"],
      json["category"],
      json["image"],
      isFavorite,
    );
  }
}
