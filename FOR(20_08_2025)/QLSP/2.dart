import 'utils/product_utils.dart';
import 'dart:io';

void main() {
  Store store = Store();
  while (true) {
    print('\n--- Quản lý sản phẩm ---');
    print('1. Thêm sản phẩm');
    print('2. Hiển thị danh sách sản phẩm');
    print('3. Tìm kiếm sản phẩm');
    print('4. Bán sản phẩm');
    print('5. Thoát');
    stdout.write('Chọn chức năng (1-5): ');
    String choice = stdin.readLineSync() ?? '';
    switch (choice) {
      case '1':
        store.addProduct();
        break;
      case '2':
        store.showProducts();
        break;
      case '3':
        store.searchProduct();
        break;
      case '4':
        store.sellProduct();
        break;
      case '5':
        print('Đã thoát chương trình.');
        return;
      default:
        print('Lựa chọn không hợp lệ.');
    }
  }
}
