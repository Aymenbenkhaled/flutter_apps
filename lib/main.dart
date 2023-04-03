import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/layout/home_layout.dart';
import 'package:flutter_app_1/modules/bmi/bmi_screen.dart';
import 'package:flutter_app_1/modules/counter/counter_screen.dart';
import 'package:flutter_app_1/modules/home/home_screen.dart';
import 'package:flutter_app_1/modules/login/login_screen.dart';
import 'package:flutter_app_1/modules/messenger/messenger_screen.dart';
import 'package:flutter_app_1/modules/users/users_screen.dart';
import 'package:flutter_app_1/shared/bloc_observer.dart';

void main()
{
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterScreen(),
    );
  }

}