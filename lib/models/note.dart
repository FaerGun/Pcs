class Gear {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int price;
  final String brand;
  final String flavor;
  final bool isFavorite;
  int quantity;

  Gear({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.brand,
    required this.flavor,
    this.isFavorite = false,
    this.quantity = 1,
  });

  factory Gear.fromJson(Map<String, dynamic> json) {
    return Gear(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      price: json['price'],
      brand: json['brand'],
      flavor: json['flavor'],
      isFavorite: json['is_favorite'] ?? false,
      quantity: json['quantity'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
      'price': price,
      'brand': brand,
      'flavor': flavor,
      'is_favorite': isFavorite,
      'quantity': quantity,
    };
  }
}