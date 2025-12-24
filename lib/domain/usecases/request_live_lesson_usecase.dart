import '../entities/instructor_entity.dart';
import '../repositories/matching_repository.dart';

class RequestLiveLessonUseCase {
  final MatchingRepository repository;

  InstructorEntity? _lastAssignedInstructor;

  RequestLiveLessonUseCase(this.repository);

  Future<InstructorEntity> call() async {
    _lastAssignedInstructor = await repository.matchInstructor();
    return _lastAssignedInstructor!;
  }

  InstructorEntity? get lastAssignedInstructor => _lastAssignedInstructor;
}
