import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:flutter_app_1/modules/new_tasks/new_tasks_screen.dart';
import 'package:flutter_app_1/shared/components/components.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import '../modules/done_tasks/done_tasks_screen.dart';
import '../shared/components/constants.dart';

class HomeLayout extends StatefulWidget {
  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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

  late Database db;
  var scaffoldKea = GlobalKey<ScaffoldState>();
  var formKea = GlobalKey<FormState>();
  bool bol = false;
  var titleControler = TextEditingController();
  var timeControler = TextEditingController();
  var dateControler = TextEditingController();
  IconData fabIcon = Icons.edit;



  @override
  void initState() {
    super.initState();
    createDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKea,
      appBar: AppBar(
        title: Text(Titles[index]),
      ),
      body: tasks.length == 0 ? Center(child: CircularProgressIndicator()) : Screens[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (bol) {
            if (formKea.currentState!.validate()) {
                insertToDb(
                  title: titleControler.text,
                  date: dateControler.text,
                  time: timeControler.text,
                ).then((value) {
                  getDataFromDb(db).then((value) {
                    Navigator.pop(context);
                    setState(() {
                      bol = false;
                      fabIcon = Icons.edit;
                      tasks = value;
                    });
                  });
                });



              }

            }

          else {
            scaffoldKea.currentState!.showBottomSheet(
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
                              value!.format(context).toString());
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
                            lastDate: DateTime.parse('2023-07-31'),
                          ).then((value) => dateControler.text =
                              DateFormat.yMMMd().format(value!));
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
            ).closed.then((value) {
              bol = false;
              setState(() {
                fabIcon = Icons.edit;
              });
            });
            bol = true;
            setState(() {
              fabIcon = Icons.add;
            });
          }
        },
        child: Icon(fabIcon),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
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
  }

  Future<String> getName() async {
    return 'Aymen Benkhaled';
  }

  void createDb() async {
    db = await openDatabase(
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
          setState(() {
            tasks = value;
          });
          print(tasks[0]);
        });
        print('db Opened');
      },
    );
  }

  Future insertToDb({
    required String title,
    required String date,
    required String time,
}) async
  {
    return await db.transaction((txn) {
      txn.rawInsert(
              'INSERT INTO tasks(title,date,time,status) VALUES ("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('the error of insertion is ${error.toString()}');
      });
      return Future(() => null);
    });
  }

  Future<List<Map>> getDataFromDb(db) async
  {
    return await db.rawQuery('SELECT * FROM tasks');
  }
}
