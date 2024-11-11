class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl; // Новое поле для изображения

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl, // Новое поле для изображения
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['ID'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'].toDouble(),
      imageUrl: json['ImageURL'], // Предполагаем, что API возвращает это поле
    );
  }
}