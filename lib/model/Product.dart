class Product {
  final int id;
  final String title;
  final String description;
  final double price;
  final List images;
  final String creationAt;
  final String updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.creationAt,
    required this.updatedAt
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      // Safely parse the price
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : double.tryParse(json['price']?.toString() ?? '0.0') ?? 0.0,
      images: json['images'] ?? '',
      creationAt: json['creationAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
    );
  }
}
