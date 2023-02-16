import 'package:el7dor/Screen/cubit/home_cubit.dart';
import 'package:el7dor/Screen/scan_qr.dart';
import 'package:el7dor/Screen/show_student.dart';
import 'package:el7dor/model/student_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/componant.dart';

class Dashbord extends StatelessWidget {
  Dashbord({Key? key}) : super(key: key);
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
        backgroundColor: Colors.white.withOpacity(.9),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8,),
              Expanded(
                flex: 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SectionCard(title: "${item.name}", count: "${item.count}")
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: InkWell(
                            onTap:(){
                              NavigatPushTo(context: context, widget: const QRViewExample());
                            },
                            child: CastumCard(color: Colors.deepOrange,
                              child: Icon(Icons.qr_code_scanner_rounded,color: Colors.white,),
                            )
                        ),
                      ),
                     Expanded(
                       flex: 2,
                       child: InkWell(
                           onTap:(){
                             NavigatPushTo(context: context, widget:ShowStudent() );
                           },
                           child: CastumCard(color: Colors.deepOrange,
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text("Show more",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                                   Icon(Icons.more_horiz,color: Colors.white,),
                                 ],
                               ),
                           )
                       ),
                     )

                    ],
                  ),
                ),
              ),

              SizedBox(height: 8,),
            ],
          ),
        ),
      ),
    );
  }
}
