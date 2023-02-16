

import 'package:bloc/bloc.dart';
import 'package:el7dor/Screen/cubit/state.dart';
import 'package:el7dor/model/student_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:sqflite/sqflite.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit(): super(InitialState());
  static HomeCubit get(context)=>BlocProvider.of(context);

final box=Hive.box('el7dor_box');
List sections=[];
int? current_section;

Future<void> addSection(Section newItem)async{
  print("add new item");
  List <Student>stu=newItem.students.toList();
  for(int i=0;i<newItem.count!;i++){
    stu.add(Student(id:"${i+1}",attend: 0,unattend: 0));

    emit(ChangeCounter());
  }
  newItem.students=stu;
  print("${newItem.students[1].id} ${newItem.students[2].id}");
  await box.add({'name':newItem.name,'section':newItem});
  print("add new item done");
  print("created done ${box.length}");

  emit(addToSectionState());
  getSections();
}
  var data;
  Future<void> getSections()async{
  sections=[];
  if(sections.isEmpty){
   data=box.keys.map((key) {
    final item=box.get(key);
    print(item);
    sections.add(item);
    print("${item['name'] }// ${item['section']}");
  }).toList();
 // sections=data.cast<Section>().toList();
  print("${sections.length}");
  emit(getDataState());
   }

  }
  Future<void> updateStudentAttand({required String studentId})
  async {
    var item;
   item= box.getAt(current_section!);
  Section section=item['section'];
  List<Student> students=section.students;
   students.forEach((element) {
     if(element.id==studentId.replaceAll(' ', '')){
       element.attend=(element.attend??0)+1;
       print("/////////////${element.attend}");
       section.students=students.toList();
       box.putAt(current_section!,{'name':section.name,'section':section});
       emit(UpdateSectionState());
       getSections();
     }
   });
  }
  }