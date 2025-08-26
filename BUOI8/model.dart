class Product {
  String name;
  int quantity;
  double price;

  Product({required this.name, required this.quantity, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}
