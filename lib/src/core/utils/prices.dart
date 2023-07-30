import 'package:intl/intl.dart';

num stringToMonetaryValue(String value) {
  String cleanedValue = value.replaceAll(RegExp(r'[^0-9.,]'), '');

  cleanedValue = cleanedValue.replaceAll(',', '.');

  return double.parse(cleanedValue);
}

String monetaryValueToString(num value) {
  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return formatter.format(value);
}

num calculateTotalPriceByQuantity(int quantity, num price) {
  return quantity * price;
}
