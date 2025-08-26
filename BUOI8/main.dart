import 'entities.dart';
import 'dart:io';

void main() {
	while (true) {
		print('\n--- Quản lý hóa đơn bán hàng ---');
		print('1. Thêm sản phẩm vào giỏ hàng');
		print('2. Sửa sản phẩm trong giỏ hàng');
		print('3. Xóa sản phẩm khỏi giỏ hàng');
		print('4. Hiển thị giỏ hàng');
		print('5. Tính tổng tiền hóa đơn');
		print('0. Thoát');
		stdout.write('Chọn chức năng: ');
		String? choice = stdin.readLineSync();
		switch (choice) {
			case '1':
				addProduct();
				break;
			case '2':
				editProduct();
				break;
			case '3':
				removeProduct();
				break;
			case '4':
				showCart();
				break;
			case '5':
				totalAmount();
				break;
			case '0':
				print('Kết thúc chương trình.');
				return;
			default:
				print('Chức năng không hợp lệ!');
		}
	}
}
