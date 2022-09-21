import 'package:hive_flutter/adapters.dart';
part 'data_model.g.dart';

@HiveType(typeId: 0)
class StudentModal {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String classs;
  @HiveField(2)
  final String divission;
  @HiveField(3)
  final String rollno;

  StudentModal({
    required this.name,
    required this.classs,
    required this.divission,
    required this.rollno,
  });
}
