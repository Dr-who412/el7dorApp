import 'package:el7dor/Screen/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/student_model.dart';
import '../shared/componant.dart';

class ShowStudent extends StatelessWidget {
  const ShowStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<HomeCubit>();
    Section item=cubit.sections[cubit.current_section!]['section'];
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Scaffold(
        body:
        ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: item.count,
            itemBuilder:(context,index)=>Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap:(){
                  print("${item.students![index].id}");
                },
                child: CastumCard(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "${item.students![index].id}",
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),textAlign: TextAlign.center,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "attend",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.withOpacity(.4),
                                  shape: BoxShape.circle,
                                ),

                                child: Text(
                                  "${item.students![index].attend??0}",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                "missed",
                                style: TextStyle(fontWeight: FontWeight.bold,color: Colors.deepOrange),
                                textAlign: TextAlign.center,
                              ),
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange.withOpacity(.4),
                                  shape: BoxShape.circle,
                                ),
                                child: Text(
                                  "${item.students![index].unattend??" not yet! "}",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ),
      ),
    );
  }
}
