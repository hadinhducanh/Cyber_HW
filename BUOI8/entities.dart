import 'model.dart';
import 'dart:io';

List<Product> cart = [];

void addProduct() {
  stdout.write('Nhập tên sản phẩm: ');
  String name = stdin.readLineSync() ?? '';
  stdout.write('Nhập số lượng: ');
  int quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
  stdout.write('Nhập giá tiền: ');
  double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
  cart.add(Product(name: name, quantity: quantity, price: price));
  print('Đã thêm sản phẩm vào giỏ hàng.');
}

void editProduct() {
  showCart();
  stdout.write('Nhập vị trí sản phẩm cần sửa: ');
  int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  if (index > 0 && index <= cart.length) {
    int i = index - 1;
    stdout.write('Nhập tên mới (bỏ qua nếu không đổi): ');
    String name = stdin.readLineSync() ?? '';
    if (name.isNotEmpty) cart[i].name = name;
    stdout.write('Nhập số lượng mới (bỏ qua nếu không đổi): ');
    String quantityStr = stdin.readLineSync() ?? '';
    if (quantityStr.isNotEmpty) cart[i].quantity = int.tryParse(quantityStr) ?? cart[i].quantity;
    stdout.write('Nhập giá mới (bỏ qua nếu không đổi): ');
    String priceStr = stdin.readLineSync() ?? '';
    if (priceStr.isNotEmpty) cart[i].price = double.tryParse(priceStr) ?? cart[i].price;
    print('Đã sửa sản phẩm.');
  } else {
    print('Không tìm thấy sản phẩm ở vị trí đó.');
  }
}



void removeProduct() {
  showCart();
  stdout.write('Nhập vị trí sản phẩm cần xóa: ');
  int index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
  if (index > 0 && index <= cart.length) {
    cart.removeAt(index - 1);
    print('Đã xóa sản phẩm.');
  } else {
    print('Không tìm thấy sản phẩm ở vị trí đó.');
  }
}

void showCart() {
  print('--- Giỏ hàng ---');
  for (int i = 0; i < cart.length; i++) {
    var p = cart[i];
    print('${i + 1}. Tên: ${p.name}, Số lượng: ${p.quantity}, Giá: ${p.price}');
  }
  if (cart.isEmpty) print('Giỏ hàng trống');
}

void totalAmount() {
  double total = 0;
  for (var p in cart) {
    total += p.quantity * p.price;
  }
  print('Tổng tiền hóa đơn: $total');
}
