// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 0)
class Customer {
  @HiveField(0)
  final String customerId;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String mobileNo;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final bool isDeleted;

  Customer({
    required this.customerId,
    required this.name,
    required this.mobileNo,
    required this.email,
    required this.isDeleted,
  });

  @override
  String toString() {
    return 'Customer(customerId: $customerId, name: $name, mobileNo: $mobileNo, email: $email, isDeleted: $isDeleted)';
  }

  Customer copyWith({
    String? customerId,
    String? name,
    String? mobileNo,
    String? email,
    bool? isDeleted,
  }) {
    return Customer(
      customerId: customerId ?? this.customerId,
      name: name ?? this.name,
      mobileNo: mobileNo ?? this.mobileNo,
      email: email ?? this.email,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
