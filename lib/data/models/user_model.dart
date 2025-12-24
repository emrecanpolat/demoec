import '../../domain/entities/user_entity.dart';
import '../../core/enums/user_role.dart';

class UserModel {
  final String id;
  final String email;
  final UserRole role;

  UserModel({
    required this.id,
    required this.email,
    required this.role,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      email: email,
      role: role,
    );
  }
}
