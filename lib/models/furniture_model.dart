class Furniture {
  int id;
  String category;
  String description;
  int stock;
  double price;
  String image;

  Furniture(
      {required this.id,
      required this.category,
      required this.description,
      required this.stock,
      required this.price,
      required this.image});
  Map<String, dynamic> toMap() {
    return {
      'id_furniture': id,
      'category': category,
      'description': description,
      'stock': stock,
      'price': price,
      'image': image,
    };
  }

  factory Furniture.fromMap(Map<String, dynamic> map) {
    return Furniture(
      id: map['id_furniture'],
      category: map['category'],
      description: map['description'],
      stock: map['stock'],
      price: map['price'],
      image: map['image'],
    );
  }
}
