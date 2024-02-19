import 'package:ecommerce_shoppers/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart extends Product {
  int count = 0;
  Cart(super.title, super.price, super.id, super.description, super.image,
      super.category, this.count);

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}
