import 'dart:io';

void main() {
  while (true) {
    stdout.write('Input name: ');
    String name = stdin.readLineSync() ?? '';

    stdout.write('Input working hours: ');
    double workingHours = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Input hourly wage: ');
    double hourlyWage = double.parse(stdin.readLineSync() ?? '0');

    double totalSalary = workingHours * hourlyWage;

    if (workingHours > 40) {
      totalSalary *= 1.2;
    }

    double tax = 0;
    if (totalSalary > 10000000) {
      tax = totalSalary * 0.1;
    } else if (totalSalary >= 7000000) {
      tax = totalSalary * 0.05;
    }

    double netSalary = totalSalary - tax;

    print('\n--- Salary information ---');
    print('Name: $name');
    print('Total salary before tax: ${totalSalary.toStringAsFixed(0)}');
    print('Income tax: ${tax.toStringAsFixed(0)}');
    print('Net salary: ${netSalary.toStringAsFixed(0)}');

    stdout.write('\nDo you want to continue? (y/n): ');
    String? answer = stdin.readLineSync();
    if (answer == null || answer.toLowerCase() != 'y') {
      break;
    }
  }
}
