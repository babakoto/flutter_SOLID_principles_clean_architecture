import 'package:equatable/equatable.dart';

enum Role { admin, client }

class User extends Equatable {
  final String id;
  final String name;
  final Role role;

  const User({
    required this.id,
    required this.name,
    required this.role,
  });

  @override
  List<Object> get props => [id, name, role];
}
