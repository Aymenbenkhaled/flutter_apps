import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app_1/layout/news_app/cubit/states.dart';
import 'package:flutter_app_1/layout/news_app/news_layout.dart';
import 'package:flutter_app_1/layout/todo_app/home_layout.dart';
import 'package:flutter_app_1/modules/bmi/bmi_screen.dart';
import 'package:flutter_app_1/modules/counter/counter_screen.dart';
import 'package:flutter_app_1/modules/home/home_screen.dart';
import 'package:flutter_app_1/modules/login/login_screen.dart';
import 'package:flutter_app_1/modules/messenger/messenger_screen.dart';
import 'package:flutter_app_1/modules/users/users_screen.dart';
import 'package:flutter_app_1/shared/bloc_observer.dart';
import 'package:flutter_app_1/shared/network/local/cache_helper.dart';
import 'package:flutter_app_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()
        ..getBuseniss()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          bool? darkLight = CacheHelper.getData(key: 'DarkLight');
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                color: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.black),
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
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                color: HexColor('333739'),
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                iconTheme: IconThemeData(color: Colors.white),
                //backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                  //systemNavigationBarColor: Colors.white
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
                backgroundColor: HexColor('333739'),
                unselectedItemColor: Colors.grey[400]
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    overflow: TextOverflow.ellipsis),
              ),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
            ),
            themeMode: darkLight==true ? ThemeMode.light : ThemeMode.dark,
            debugShowCheckedModeBanner: false,
            home: NewsLayout(),
          );
        },
      ),
    );
  }
}
