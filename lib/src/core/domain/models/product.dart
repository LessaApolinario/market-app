class Product {
  int? _quantity;
  String? _name;
  num? _price;

  Product({int? quantity, String? name, num? price}) {
    if (quantity != null) {
      this._quantity = quantity;
    }
    if (name != null) {
      this._name = name;
    }
    if (price != null) {
      this._price = price;
    }
  }

  int? get quantity => _quantity;
  set quantity(int? quantity) => _quantity = quantity;
  String? get name => _name;
  set name(String? name) => _name = name;
  num? get price => _price;
  set price(num? price) => _price = price;

  Product.fromJson(Map<String, dynamic> json) {
    _quantity = json['quantity'];
    _name = json['name'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['quantity'] = this._quantity;
    data['name'] = this._name;
    data['price'] = this._price;
    return data;
  }
}
