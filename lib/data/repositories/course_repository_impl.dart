import '../../domain/entities/course_entity.dart';
import '../../domain/repositories/course_repository.dart';
import '../models/course_model.dart';

class CourseRepositoryImpl implements CourseRepository {
  @override
  Future<List<CourseEntity>> getCourses() async {
    await Future.delayed(const Duration(milliseconds: 500));

    final mockCourses = [
      CourseModel(
        id: '1',
        title: 'Flutter for Beginners',
        description: 'Learn Flutter from scratch',
        instructorName: 'John Doe',
        price: 29.99,
      ),
      CourseModel(
        id: '2',
        title: 'Advanced Dart',
        description: 'Deep dive into Dart language',
        instructorName: 'Jane Smith',
        price: 19.99,
      ),
    ];

    return mockCourses.map((e) => e.toEntity()).toList();
  }
}
