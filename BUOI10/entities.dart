import 'models.dart';
import 'dart:io';

class SchoolManager {
  List<Student> students = [];
  List<Teacher> teachers = [];
  List<Classroom> classrooms = [];

  void addStudent(Student student) {
    students.add(student);
  }

  void addTeacher(Teacher teacher) {
    teachers.add(teacher);
  }

  void addClassroom(Classroom classroom) {
    classrooms.add(classroom);
  }

  Student? findStudentById(int id) {
    try {
      return students.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  Teacher? findTeacherById(int id) {
    try {
      return teachers.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  Classroom? findClassroomById(int id) {
    try {
      return classrooms.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  void assignStudentToClass(int studentId, int classId) {
    var student = findStudentById(studentId);
    var classroom = findClassroomById(classId);
    if (student != null && classroom != null) {
      classroom.addStudent(student);
    }
  }

  void assignTeacherToClass(int teacherId, int classId) {
    var teacher = findTeacherById(teacherId);
    var classroom = findClassroomById(classId);
    if (teacher != null && classroom != null) {
      classroom.addTeacher(teacher);
    }
  }

  void showClassReport() {
    for (var classroom in classrooms) {
      classroom.displayInfo();
      print('---');
    }
  }

  void showStudentScores() {
    for (var student in students) {
      print('Student: ${student.name}, Score: ${student.score}');
    }
  }

    void inputStudent() {
      print('Nhập số lượng học sinh:');
      int? n = int.tryParse(stdin.readLineSync() ?? '');
      if (n == null || n <= 0) return;
      for (int i = 0; i < n; i++) {
        print('Nhập thông tin học sinh thứ ${i + 1}:');
        int? id;
        while (true) {
          print('ID:');
          id = int.tryParse(stdin.readLineSync() ?? '');
          if (id == null) {
            print('ID không hợp lệ!');
            continue;
          }
          if (findStudentById(id) != null) {
            print('ID đã tồn tại, vui lòng nhập lại!');
            continue;
          }
          break;
        }
        String name;
        while (true) {
          print('Tên:');
          name = stdin.readLineSync() ?? '';
          if (name.isEmpty) {
            print('Tên không được để trống!');
            continue;
          }
          break;
        }
        int? age;
        while (true) {
          print('Tuổi:');
          age = int.tryParse(stdin.readLineSync() ?? '');
          if (age == null || age < 5 || age > 100) {
            print('Tuổi phải là số từ 5 đến 100!');
            continue;
          }
          break;
        }
        String gender;
        while (true) {
          print('Giới tính (Nam/Nữ):');
          gender = stdin.readLineSync() ?? '';
          if (gender.toLowerCase() != 'nam' && gender.toLowerCase() != 'nữ') {
            print('Giới tính phải là "Nam" hoặc "Nữ"!');
            continue;
          }
          break;
        }
        int? grade;
        while (true) {
          print('Lớp:');
          grade = int.tryParse(stdin.readLineSync() ?? '');
          if (grade == null || grade < 1 || grade > 12) {
            print('Lớp phải là số từ 1 đến 12!');
            continue;
          }
          break;
        }
        double? score;
        while (true) {
          print('Điểm:');
          score = double.tryParse(stdin.readLineSync() ?? '');
          if (score == null || score < 0 || score > 10) {
            print('Điểm phải là số từ 0 đến 10!');
            continue;
          }
          break;
        }
        addStudent(Student(id: id, name: name, age: age, gender: gender, grade: grade, score: score));
      }
    }

    void inputTeacher() {
      print('Nhập số lượng giáo viên:');
      int? n = int.tryParse(stdin.readLineSync() ?? '');
      if (n == null || n <= 0) return;
      for (int i = 0; i < n; i++) {
        print('Nhập thông tin giáo viên thứ ${i + 1}:');
        int? id;
        while (true) {
          print('ID:');
          id = int.tryParse(stdin.readLineSync() ?? '');
          if (id == null) {
            print('ID không hợp lệ!');
            continue;
          }
          if (findTeacherById(id) != null) {
            print('ID đã tồn tại, vui lòng nhập lại!');
            continue;
          }
          break;
        }
        String name;
        while (true) {
          print('Tên:');
          name = stdin.readLineSync() ?? '';
          if (name.isEmpty) {
            print('Tên không được để trống!');
            continue;
          }
          break;
        }
        int? age;
        while (true) {
          print('Tuổi:');
          age = int.tryParse(stdin.readLineSync() ?? '');
          if (age == null || age < 18 || age > 100) {
            print('Tuổi phải là số từ 18 đến 100!');
            continue;
          }
          break;
        }
        String gender;
        while (true) {
          print('Giới tính (Nam/Nữ):');
          gender = stdin.readLineSync() ?? '';
          if (gender.toLowerCase() != 'nam' && gender.toLowerCase() != 'nữ') {
            print('Giới tính phải là "Nam" hoặc "Nữ"!');
            continue;
          }
          break;
        }
        String subject;
        while (true) {
          print('Môn dạy:');
          subject = stdin.readLineSync() ?? '';
          if (subject.isEmpty) {
            print('Môn dạy không được để trống!');
            continue;
          }
          break;
        }
        double? salary;
        while (true) {
          print('Lương:');
          salary = double.tryParse(stdin.readLineSync() ?? '');
          if (salary == null || salary < 0) {
            print('Lương phải là số lớn hơn hoặc bằng 0!');
            continue;
          }
          break;
        }
        addTeacher(Teacher(id: id, name: name, age: age, gender: gender, subject: subject, salary: salary));
      }
    }
}
