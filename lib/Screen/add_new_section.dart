import 'package:el7dor/Screen/cubit/home_cubit.dart';
import 'package:el7dor/Screen/home.dart';
import 'package:el7dor/Screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../model/student_model.dart';
import '../shared/componant.dart';
import 'cubit/state.dart';

class AddNewSection extends StatelessWidget {
  AddNewSection({Key? key}) : super(key: key);
  var section = TextEditingController();
  var numberofStudent = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.9),
        body: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: CastumCard(
              color: Colors.deepOrange,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextFaildCustom(
                        controller: section,
                        hint: "اسم الدفعة الدراسية",
                        isPassword: false,
                        type: TextInputType.text,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "يجب اضافة اسم الدفعة او المجموعة";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      child: TextFaildCustom(
                        controller: numberofStudent,
                        hint: "عدد الحضور ",
                        isPassword: false,
                        type: TextInputType.number,
                        validate: (value) {
                          if (value.isEmpty) {
                            return "يجب اضافة عدد الطلاب";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    BlocListener<HomeCubit, HomeState>(
                      listener: (context, state) {
                        // TODO: implement listener}
                        if (state is addToSectionState) {
                          numberofStudent.text = '';
                          section.text = '';
                        }
                        if (state is getDataState) {
                          Navigator.pop(context);
                        }
                      },
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            HomeCubit.get(context).addSection(
                                Section(name: section.text,
                                  count: int.parse(numberofStudent.text),
                                  students: <Student>[],));
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: Text(
                          "add new section",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrange),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
