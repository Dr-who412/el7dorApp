import 'package:el7dor/Screen/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../shared/componant.dart';
import 'add_new_section.dart';
import 'cubit/home_cubit.dart';
import 'cubit/state.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
  listener: (context, state) {
    // TODO: implement listener
  },
      buildWhen: (current,state){
    if(state is getDataState){
      print("objectttttttttttt");
      return true;
    }
    return true;
      },
  builder: (context, state) {
    var cubit=HomeCubit.get(context);
    return SafeArea(
      top: true,
      bottom: true,
      right: true,
      left: true,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        body: cubit.sections.isEmpty?
        Center(child: Text("Empty box! , Add sections", style: TextStyle(color: Colors.white54,fontSize: 36,fontWeight: FontWeight.bold),)):
        Container(
          height: double.infinity,
          width: double.infinity,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: cubit.sections.length,
              itemBuilder:(context,int index)=>InkWell(
                onTap:(){
                  cubit.current_section=index;
                  NavigatPushTo(context: context,widget:Dashbord() );
                },
                child: SectionCard(title: "${cubit.sections[index]['name']}",
                    count: "${cubit.sections[index]['section'].count}"),
              ),
          ),
        ),
        floatingActionButton:Card(
          elevation: 12,
          color: Colors.deepOrange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          child: InkWell(
            onTap: (){
              NavigatPushTo(context: context, widget: AddNewSection(),);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("new section",
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  Icon(Icons.add,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  },
);
  }
}
