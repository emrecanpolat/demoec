import '../entities/course_entity.dart';

class GetPurchasedCoursesUseCase {
  final List<CourseEntity> _purchasedCourses = [];

  List<CourseEntity> getPurchasedCourses() {
    return List.unmodifiable(_purchasedCourses);
  }

  void addCourse(CourseEntity course) {
    if (_purchasedCourses.any((c) => c.id == course.id)) return;
    _purchasedCourses.add(course);
  }
}
