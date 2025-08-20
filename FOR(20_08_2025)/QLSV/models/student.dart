class Student {
  String name;
  double math;
  double physics;
  double chemistry;

  Student({required this.name, required this.math, required this.physics, required this.chemistry});

  double get average => (math + physics + chemistry) / 3;

  String get rank {
    double avg = average;
    if (avg < 5) return 'Kém';
    if (avg < 7) return 'Khá';
    if (avg < 9) return 'Giỏi';
    return 'Xuất sắc';
  }
}
