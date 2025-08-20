class Product {
  String name;
  double price;
  int quantity;

  Product(this.name, this.price, this.quantity);

  @override
  String toString() {
    return 'Tên: $name | Giá: ${price.toStringAsFixed(2)} | Số lượng: $quantity';
  }
}
