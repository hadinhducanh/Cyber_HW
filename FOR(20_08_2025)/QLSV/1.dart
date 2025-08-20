import 'dart:io';
import 'models/student.dart';
import 'utils/student_utils.dart';

void main() {
	List<Student> students = [];
	while (true) {
		print('\n--- Quản lý danh sách sinh viên ---');
		print('1. Thêm sinh viên');
		print('2. Hiển thị danh sách sinh viên');
		print('3. Tìm sinh viên có ĐTB cao nhất');
		print('4. Thoát');
		stdout.write('Chọn chức năng: ');
		var choice = stdin.readLineSync();
		switch (choice) {
			case '1':
				stdout.write('Nhập họ tên: ');
				String? name = stdin.readLineSync();
				stdout.write('Nhập điểm Toán: ');
				double math = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
				stdout.write('Nhập điểm Lý: ');
				double physics = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
				stdout.write('Nhập điểm Hóa: ');
				double chemistry = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
				if (name != null && name.isNotEmpty) {
					students.add(Student(name: name, math: math, physics: physics, chemistry: chemistry));
					print('Đã thêm sinh viên!');
				} else {
					print('Tên không hợp lệ!');
				}
				break;
			case '2':
				StudentUtils.printStudentList(students);
				break;
			case '3':
				var top = StudentUtils.findTopStudent(students);
				if (top != null) {
					print('Sinh viên có ĐTB cao nhất:');
					print('Họ tên: ${top.name}, ĐTB: ${top.average.toStringAsFixed(2)}, Xếp loại: ${top.rank}');
				} else {
					print('Danh sách rỗng!');
				}
				break;
			case '4':
				print('Thoát chương trình.');
				return;
			default:
				print('Chức năng không hợp lệ!');
		}
	}
}
