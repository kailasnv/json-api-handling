class ProductModal {
  final int id;
  final String title;
  final String description;
  final num price;
  final String image;

  ProductModal({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
  });

  factory ProductModal.fromJson(Map<String, dynamic> json) {
    return ProductModal(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      price: json["price"],
      image: json["image"],
    );
  }
}
