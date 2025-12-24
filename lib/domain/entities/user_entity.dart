import '../../core/enums/user_role.dart';

class UserEntity {
  final String id;
  final String email;
  final UserRole role;

  UserEntity({
    required this.id,
    required this.email,
    required this.role,
  });
}
