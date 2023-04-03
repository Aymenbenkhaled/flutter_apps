import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_app_1/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter_app_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/new_tasks/new_tasks_screen.dart';
import '../components/constants.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super (AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late Database db;

  int index = 0;
  List<Widget> Screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String> Titles = [
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void ChangeIndex(value){
    index = value;
    emit(AppChangeIndexState());
  }

  void createDb()  {
    openDatabase(
      'Todo.db',
      version: 1,
      onCreate: (db, version) {
        print('db created');
        db
            .execute(
            'CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)')
            .then((value) {
          print('table created');
        }).catchError((error) {
          print('the error is ${error.toString()}');
        });
      },
      onOpen: (db) {
        getDataFromDb(db).then((value) {
          // setState(() {
          //   tasks = value;
          // });
          print(tasks[0]);
        });
        print('db Opened');
      },
    ).then((value) => emit(AppCreateDbState()));

  }

  Future insertToDb({
    required String title,
    required String date,
    required String time,
  }) {
    return db.transaction((txn) {
      txn
          .rawInsert(
          'INSERT INTO tasks(title,date,time,status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('the error of insertion is ${error.toString()}');
      });
      return Future(() => null);
    }).then((value) => emit(AppInsertToDbState()));

  }

  Future<List<Map>> getDataFromDb(db)  {
    return db.rawQuery('SELECT * FROM tasks').then((value) => emit(AppGetFromDbState()));
  }


}