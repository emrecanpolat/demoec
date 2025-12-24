import '../../domain/entities/instructor_entity.dart';
import '../../domain/repositories/matching_repository.dart';

class MatchingRepositoryImpl implements MatchingRepository {
  @override
  Future<InstructorEntity> matchInstructor() async {
    await Future.delayed(const Duration(seconds: 1));

    return InstructorEntity(
      id: 'inst_1',
      name: 'John Instructor',
    );
  }
}
