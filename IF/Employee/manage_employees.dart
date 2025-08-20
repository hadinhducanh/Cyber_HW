import 'dart:io';

void main() {
  List<Employee> employees = [];

  while (true) {
    stdout.write('Input name: ');
    String name = stdin.readLineSync() ?? '';

    stdout.write('Input working hours: ');
    double workingHours = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Input hourly wage: ');
    double hourlyWage = double.parse(stdin.readLineSync() ?? '0');

    Employee employee = Employee(name, workingHours, hourlyWage);
    employees.add(employee);

    stdout.write('\nDo you want to continue? (y/n): ');
    String? answer = stdin.readLineSync();
    if (answer == null || answer.toLowerCase() != 'y') {
      break;
    }
  }

  print('\n--- Salary information ---');
  for (var emp in employees) {
    print('Name: ${emp.name}');
    print(
      'Total salary before tax: ${emp.calculateTotalSalary().toStringAsFixed(0)}',
    );
    print('Income tax: ${emp.calculateTax().toStringAsFixed(0)}');
    print('Net salary: ${emp.calculateNetSalary().toStringAsFixed(0)}');
  }
}

class Employee {
  String name;
  double workingHours;
  double hourlyWage;

  Employee(this.name, this.workingHours, this.hourlyWage);

  double calculateTotalSalary() {
    double totalSalary = workingHours * hourlyWage;

    if (workingHours > 40) {
      totalSalary *= 1.2;
    }

    return totalSalary;
  }

  double calculateTax() {
    double totalSalary = calculateTotalSalary();
    double tax = 0;

    if (totalSalary > 10000000) {
      tax = totalSalary * 0.1;
    } else if (totalSalary >= 7000000) {
      tax = totalSalary * 0.05;
    }

    return tax;
  }

  double calculateNetSalary() {
    return calculateTotalSalary() - calculateTax();
  }
}
