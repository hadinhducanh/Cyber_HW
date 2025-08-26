class Person {
  int id;
  String name;
  int age;
  String gender;

  Person({required this.id, required this.name, required this.age, required this.gender});
}

class Student extends Person {
  int grade;
  double score;

  Student({required int id, required String name, required int age, required String gender, required this.grade, required this.score})
      : super(id: id, name: name, age: age, gender: gender);

 void displayInfo() {
    print('Student Info: ID: $id, Name: $name, Age: $age, Gender: $gender, Grade: $grade, Score: $score');
  }
}

class Teacher extends Person {
  String subject;
  double salary;

  Teacher({required int id, required String name, required int age, required String gender, required this.subject, required this.salary})
      : super(id: id, name: name, age: age, gender: gender);

  void displayInfo() {
    print('Teacher Info: ID: $id, Name: $name, Age: $age, Gender: $gender, Subject: $subject, Salary: $salary');
  }
}

class Classroom {
  int id;
  String name;
  List<Student> students;
  List<Teacher> teachers;

  Classroom({required this.id, required this.name, required this.students, required this.teachers});

  void addStudent(Student student) {
    students.add(student);
  }

  void addTeacher(Teacher teacher) {
    teachers.add(teacher);
  }

  void displayInfo() {
    print('Classroom Info: ID: $id, Name: $name');
    print('Students:');
    for (var student in students) {
      student.displayInfo();
    }
    print('Teachers:');
    for (var teacher in teachers) {
      teacher.displayInfo();
    }
  }
}