import '../entities/instructor_entity.dart';

abstract class MatchingRepository {
  Future<InstructorEntity> matchInstructor();
}
