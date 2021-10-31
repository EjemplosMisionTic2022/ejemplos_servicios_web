class ProductModel {
  String name, price, imageUrl, description, category, brand;

  ProductModel(
      {required this.name,
      required this.category,
      required this.description,
      required this.imageUrl,
      required this.price,
      required this.brand});

  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
      brand: map['brand'] ?? "No Brand",
      category: map['category'] ?? "No Category",
      description: map['description'] ?? "No Description",
      imageUrl: "http:" + map['api_featured_image'],
      name: map['name'],
      price: map['price'] ?? "0.0"
    );
  }
}