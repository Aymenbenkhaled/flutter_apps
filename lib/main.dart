import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/layout/news_app/news_layout.dart';
import 'package:flutter_app_1/layout/todo_app/home_layout.dart';
import 'package:flutter_app_1/modules/bmi/bmi_screen.dart';
import 'package:flutter_app_1/modules/counter/counter_screen.dart';
import 'package:flutter_app_1/modules/home/home_screen.dart';
import 'package:flutter_app_1/modules/login/login_screen.dart';
import 'package:flutter_app_1/modules/messenger/messenger_screen.dart';
import 'package:flutter_app_1/modules/users/users_screen.dart';
import 'package:flutter_app_1/shared/bloc_observer.dart';
import 'package:flutter_app_1/shared/network/remote/dio_helper.dart';

void main()
{
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          //backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            //systemNavigationBarColor: Colors.white
          ),

        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blueGrey,
        ),
        scaffoldBackgroundColor: Colors.black12,
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: NewsLayout(),
    );
  }

}