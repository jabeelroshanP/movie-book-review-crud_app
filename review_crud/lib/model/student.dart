import 'package:hive/hive.dart';
  part 'student.g.dart';

@HiveType(typeId:0)
class Model {
@HiveField(0)
String?name;

@HiveField(1)
String?date;

@HiveField(2)
String?review;

Model({
  required this.name,
  required this.date,
  required this.review
});
  
}