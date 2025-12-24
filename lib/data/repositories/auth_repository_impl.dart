import '../../core/enums/user_role.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<UserEntity> login(String email) async {
    if (email.contains('admin')) {
      return UserEntity(id: '1', email: email, role: UserRole.admin);
    } else if (email.contains('inst')) {
      return UserEntity(id: '2', email: email, role: UserRole.instructor);
    }
    return UserEntity(id: '3', email: email, role: UserRole.user);
  }
}
