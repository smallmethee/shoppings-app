import 'dart:convert';

class UserOrder {
  final int productId;
  final String name;
  final double price;
  final int quantity;

  UserOrder({
    required this.productId,
    required this.name,
    required this.price,
    required this.quantity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'productId': productId,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory UserOrder.fromMap(Map<String, dynamic> map) {
    return UserOrder(
      productId: map['productId'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOrder.fromJson(String source) =>
      UserOrder.fromMap(json.decode(source) as Map<String, dynamic>);

  UserOrder copyWith({
    int? productId,
    String? name,
    double? price,
    int? quantity,
  }) {
    return UserOrder(
      productId: productId ?? this.productId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}
