import '../models/student.dart';

class StudentUtils {
  static void printStudentList(List<Student> students) {
    print('Danh sách sinh viên:');
    for (var s in students) {
      print('Họ tên: ${s.name}, Toán: ${s.math}, Lý: ${s.physics}, Hóa: ${s.chemistry}, ĐTB: ${s.average.toStringAsFixed(2)}, Xếp loại: ${s.rank}');
    }
  }

  static Student? findTopStudent(List<Student> students) {
    if (students.isEmpty) return null;
    students.sort((a, b) => b.average.compareTo(a.average));
    return students.first;
  }
}
