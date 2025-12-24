import '../../domain/entities/course_entity.dart';

class CourseModel {
  final String id;
  final String title;
  final String description;
  final String instructorName;
  final double price;

  CourseModel({
    required this.id,
    required this.title,
    required this.description,
    required this.instructorName,
    required this.price,
  });

  CourseEntity toEntity() {
    return CourseEntity(
      id: id,
      title: title,
      description: description,
      instructorName: instructorName,
      price: price,
    );
  }
}
