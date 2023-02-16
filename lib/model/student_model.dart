import 'package:hive/hive.dart';
part 'student_model.g.dart';

@HiveType(typeId:0,adapterName:'SectionAdapter')
class Section extends HiveObject{
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? count;
  @HiveField(2)
  List <Student> students=[];
  Section({this.name,this.count,required this.students});
}
@HiveType(typeId:1,adapterName:'StudentAdapter')
class Student extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  int? attend;
  @HiveField(2)
  int? unattend;
  Student({this.id,this.attend,this.unattend});
}