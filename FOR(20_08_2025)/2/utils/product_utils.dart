import '../models/product.dart';
import 'dart:io';

class Store {
  List<Product> products = [];

  void addProduct() {
    stdout.write('Nhập tên sản phẩm: ');
    String name = stdin.readLineSync() ?? '';
    stdout.write('Nhập giá tiền: ');
    double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
    stdout.write('Nhập số lượng trong kho: ');
    int quantity = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    products.add(Product(name, price, quantity));
    print('Đã thêm sản phẩm.');
  }

  void showProducts() {
    if (products.isEmpty) {
      print('Danh sách sản phẩm trống.');
      return;
    }
    print('--- Danh sách sản phẩm ---');
    for (var p in products) {
      print(p);
    }
  }

  void searchProduct() {
    stdout.write('Nhập tên sản phẩm cần tìm: ');
    String name = stdin.readLineSync() ?? '';
    var found = products.where(
      (p) => p.name.toLowerCase().contains(name.toLowerCase()),
    );
    if (found.isEmpty) {
      print('Không tìm thấy sản phẩm.');
    } else {
      print('Kết quả tìm kiếm:');
      for (var p in found) {
        print(p);
      }
    }
  }

  void sellProduct() {
    stdout.write('Nhập tên sản phẩm cần bán: ');
    String name = stdin.readLineSync() ?? '';
    var found = products.where(
      (p) => p.name.toLowerCase() == name.toLowerCase(),
    );
    if (found.isEmpty) {
      print('Không tìm thấy sản phẩm.');
      return;
    }
    var product = found.first;
    stdout.write('Nhập số lượng cần bán: ');
    int sellQty = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    if (sellQty <= 0) {
      print('Số lượng bán không hợp lệ.');
      return;
    }
    if (product.quantity >= sellQty) {
      product.quantity -= sellQty;
      print(
        'Đã bán $sellQty sản phẩm "$name". Số lượng còn lại: ${product.quantity}',
      );
    } else {
      print('Không đủ hàng trong kho.');
    }
  }
}
