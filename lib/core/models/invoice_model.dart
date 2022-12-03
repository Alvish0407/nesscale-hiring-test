// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:hive_flutter/adapters.dart';

part 'invoice_model.g.dart';

@HiveType(typeId: 2)
class Invoice {
  @HiveField(0)
  final String invoiceId;

  @HiveField(1)
  final String customerId;

  @HiveField(2)
  final DateTime dateTime;

  @HiveField(3)
  final List<OrderedItem> orderedItem;

  @HiveField(4)
  final double total;
  Invoice({
    required this.invoiceId,
    required this.customerId,
    required this.dateTime,
    required this.orderedItem,
    required this.total,
  });

  @override
  String toString() {
    return 'Invoice(invoiceId: $invoiceId, customerId: $customerId, dateTime: $dateTime, orderedItem: $orderedItem, total: $total)';
  }
}
