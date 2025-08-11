import 'dart:io';

void main() {
  stdout.write('Input product name: ');
  String productName = stdin.readLineSync() ?? '';

  stdout.write('Input quantity: ');
  int quantity = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Input unit price: ');
  double unitPrice = double.parse(stdin.readLineSync() ?? '0');

  double totalPrice = quantity * unitPrice;

  double discount = 0;
  if (totalPrice >= 1000000) {
    discount = totalPrice * 0.1;
  } else if (totalPrice >= 500000) {
    discount = totalPrice * 0.05;
  }

  double amountAfterDiscount = totalPrice - discount;

  double vat = amountAfterDiscount * 0.08;

  double totalPayment = amountAfterDiscount + vat;

  print('\n--- INVOICE ---');
  print('Product Name: $productName');
  print('Quantity: $quantity');
  print('Unit Price: ${unitPrice.toStringAsFixed(0)}');
  print('Total Price: ${totalPrice.toStringAsFixed(0)}');
  print('Discount: ${discount.toStringAsFixed(0)}');
  print('VAT (8%): ${vat.toStringAsFixed(0)}');
  print('Total Payment: ${totalPayment.toStringAsFixed(0)}');
}
