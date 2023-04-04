import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_app_1/modules/done_tasks/done_tasks_screen.dart';
import 'package:flutter_app_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';

import '../../modules/new_tasks/new_tasks_screen.dart';
import '../components/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  late Database db;
  IconData fabIcon = Icons.edit;
  bool bol = false;

  int index = 0;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

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

  void ChangeIndex(value) {
    index = value;
    emit(AppChangeIndexState());
  }

  void createDb() {
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
        getDataFromDb(db);
        print('db Opened');
      },
    ).then((value) {
      db = value;
      emit(AppCreateDbState());
    });
  }

  Future insertToDb({
    required String title,
    required String date,
    required String time,
  }) async {
    return await db.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,time,status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertToDbState());
        getDataFromDb(db);
      }).catchError((error) {
        print('the error of insertion is ${error.toString()}');
      });
      return Future(() => null);
    });
  }

  void getDataFromDb(db) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    emit(AppLoadingState());
    db.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          doneTasks.add(element);
        else
          archivedTasks.add(element);
      });
      emit(AppGetFromDbState());
    });
  }

  void updateDataFromDb({
    required String status,
    required int id,
  }) async {
    db.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getDataFromDb(db);
      emit(AppUpdateDataFromDbState());
    });
  }
  
  void deleteDataFromDb({
    required int id
}){
    db.rawDelete(
        'DELETE FROM tasks WHERE id = ?', [id]
    ).then((value) {
      getDataFromDb(db);
      emit(AppDeleteDataFromDbState());
    });
  }

  void ChangeBottomSheetState({
    required IconData icon,
    required bool boll,
  }) {
    bol = boll;
    fabIcon = icon;
    emit(AppChageBottomSheetState());
  }
}
