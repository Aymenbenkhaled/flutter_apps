import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_app_1/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_app_1/shared/components/components.dart';
import 'package:flutter_app_1/shared/cubit/cubit.dart';
import 'package:flutter_app_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/done_tasks/done_tasks_screen.dart';
import '../../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {


  var scaffoldKea = GlobalKey<ScaffoldState>();
  var formKea = GlobalKey<FormState>();

  var titleControler = TextEditingController();
  var timeControler = TextEditingController();
  var dateControler = TextEditingController();


  // @override
  // void initState() {
  //   super.initState();
  //   createDb();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDb() ,
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
          if (state is AppInsertToDbState) Navigator.pop(context);
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
                  key: scaffoldKea,
                  appBar: AppBar(
                    title: Text(cubit.Titles[cubit.index]),
                  ),
                  body: state is AppLoadingState
                      ? Center(child: CircularProgressIndicator())
                      : cubit.Screens[cubit.index],
                  floatingActionButton: FloatingActionButton(
                    onPressed: () {
                      if (cubit.bol) {
                        if (formKea.currentState!.validate()) {
                          cubit.insertToDb(
                            title: titleControler.text,
                            date: dateControler.text,
                            time: timeControler.text,
                          );
                        }
                      } else {
                        scaffoldKea.currentState!
                            .showBottomSheet(
                              (context) => Container(
                                padding: EdgeInsetsDirectional.all(20),
                                color: Colors.grey[200],
                                child: Form(
                                  key: formKea,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      defaultFormField(
                                        controller: titleControler,
                                        type: TextInputType.text,
                                        label: 'Task Title',
                                        prefIcon: Icons.title,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Title empty';
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      defaultFormField(
                                        controller: timeControler,
                                        type: TextInputType.datetime,
                                        label: 'Task Time',
                                        prefIcon: Icons.watch_later_outlined,
                                        onTap: () {
                                          showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now(),
                                          ).then((value) => timeControler.text =
                                              value!
                                                  .format(context)
                                                  .toString());
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Time empty';
                                          }
                                        },
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      defaultFormField(
                                        controller: dateControler,
                                        type: TextInputType.datetime,
                                        label: 'Task Date',
                                        prefIcon: Icons.calendar_today,
                                        onTap: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime.now(),
                                            lastDate:
                                                DateTime.parse('2023-07-31'),
                                          ).then((value) => dateControler.text =
                                              DateFormat.yMMMd()
                                                  .format(value!));
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return 'Date empty';
                                          }
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .closed
                            .then((value) {
                              cubit.ChangeBottomSheetState(icon: Icons.edit, boll: false);
                        });
                        cubit.ChangeBottomSheetState(icon: Icons.add, boll: true);

                      }
                    },
                    child: Icon(cubit.fabIcon),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      currentIndex: cubit.index,
                      onTap: (value) {
                        cubit.ChangeIndex(value);
                      },
                      items: [
                        BottomNavigationBarItem(
                          icon: Icon(Icons.menu),
                          label: 'Tasks',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.check_circle_outline),
                          label: 'Done',
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.archive_outlined),
                          label: 'Archived',
                        ),
                      ]),
                );
              }),
    );
  }



}
