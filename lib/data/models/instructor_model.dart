import '../../domain/entities/instructor_entity.dart';

class InstructorModel {
  final String id;
  final String name;

  InstructorModel({required this.id, required this.name});

  InstructorEntity toEntity() {
    return InstructorEntity(id: id, name: name);
  }
}