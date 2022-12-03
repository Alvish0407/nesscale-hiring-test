// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'item_model.g.dart';

@HiveType(typeId: 1)
class Item {
  @HiveField(0)
  final String itemId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String code;
  @HiveField(3)
  final double rate;
  @HiveField(4)
  final bool isDeleted;

  Item({
    required this.itemId,
    required this.name,
    required this.code,
    required this.rate,
    required this.isDeleted,
  });

  @override
  String toString() {
    return 'Item(itemId: $itemId, name: $name, code: $code, rate: $rate, isDeleted: $isDeleted)';
  }

  Item copyWith({
    String? itemId,
    String? name,
    String? code,
    double? rate,
    bool? isDeleted,
  }) {
    return Item(
      itemId: itemId ?? this.itemId,
      name: name ?? this.name,
      code: code ?? this.code,
      rate: rate ?? this.rate,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
