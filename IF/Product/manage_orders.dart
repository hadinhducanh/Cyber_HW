import 'dart:io';

void main() {
  List<Product> products = [];

  while (true) {
    stdout.write('Input product name: ');
    String productName = stdin.readLineSync() ?? '';

    stdout.write('Input quantity: ');
    int quantity = int.parse(stdin.readLineSync() ?? '0');

    stdout.write('Input unit price: ');
    double unitPrice = double.parse(stdin.readLineSync() ?? '0');

    Product product = Product(productName, quantity, unitPrice);
    products.add(product);

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

    stdout.write('Do you want to add another product? (y/n): ');
    String? choice = stdin.readLineSync();
    if (choice?.toLowerCase() != 'y') {
      break;
    }
  }
}

class Product {
  String name;
  int quantity;
  double unitPrice;

  Product(this.name, this.quantity, this.unitPrice);

  @override
  String toString() {
    return 'Product: $name, Quantity: $quantity, Unit Price: ${unitPrice.toStringAsFixed(0)}';
  }
}
