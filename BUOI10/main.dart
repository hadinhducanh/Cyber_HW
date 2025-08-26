import 'entities.dart';
import 'models.dart';
import 'dart:io';

void main() {
		SchoolManager manager = SchoolManager();
		for (int i = 1; i <= 10; i++) {
			manager.addStudent(Student(
				id: i,
				name: 'Student $i',
				age: 15 + (i % 5),
				gender: i % 2 == 0 ? 'Nam' : 'Nữ',
				grade: 10 + (i % 3),
				score: 5.0 + i * 0.5,
			));
		}
		for (int i = 1; i <= 3; i++) {
			manager.addTeacher(Teacher(
				id: i,
				name: 'Teacher $i',
				age: 30 + i,
				gender: i % 2 == 0 ? 'Nam' : 'Nữ',
				subject: 'Subject $i',
				salary: 1000.0 + i * 500,
			));
		}
	while (true) {
		print('\n--- HỆ THỐNG QUẢN LÝ TRƯỜNG HỌC ---');
		print('1. Nhập học sinh');
		print('2. Nhập giáo viên');
		print('3. Thêm lớp học');
		print('4. Gán học sinh vào lớp');
		print('5. Gán giáo viên vào lớp');
		print('6. Hiển thị báo cáo lớp học');
		print('7. Hiển thị điểm số học sinh');
		print('0. Thoát');
		stdout.write('Chọn chức năng: ');
		String? choice = stdin.readLineSync();
		switch (choice) {
			case '1':
				manager.inputStudent();
				break;
			case '2':
				manager.inputTeacher();
				break;
			case '3':
				print('Nhập ID lớp:');
				int? classId = int.tryParse(stdin.readLineSync() ?? '');
				print('Nhập tên lớp:');
				String className = stdin.readLineSync() ?? '';
				if (classId != null && className.isNotEmpty) {
					manager.addClassroom(Classroom(id: classId, name: className, students: [], teachers: []));
					print('Đã thêm lớp học!');
				} else {
					print('Thông tin lớp không hợp lệ!');
				}
				break;
			case '4':
				print('Nhập ID học sinh:');
				int? studentId = int.tryParse(stdin.readLineSync() ?? '');
				print('Nhập ID lớp:');
				int? classId = int.tryParse(stdin.readLineSync() ?? '');
				if (studentId != null && classId != null) {
					manager.assignStudentToClass(studentId, classId);
					print('Đã gán học sinh vào lớp!');
				} else {
					print('Thông tin không hợp lệ!');
				}
				break;
			case '5':
				print('Nhập ID giáo viên:');
				int? teacherId = int.tryParse(stdin.readLineSync() ?? '');
				print('Nhập ID lớp:');
				int? classId = int.tryParse(stdin.readLineSync() ?? '');
				if (teacherId != null && classId != null) {
					manager.assignTeacherToClass(teacherId, classId);
					print('Đã gán giáo viên vào lớp!');
				} else {
					print('Thông tin không hợp lệ!');
				}
				break;
			case '6':
				manager.showClassReport();
				break;
			case '7':
				manager.showStudentScores();
				break;
			case '0':
				print('Kết thúc chương trình.');
				return;
			default:
				print('Chức năng không hợp lệ!');
		}
	}
}
