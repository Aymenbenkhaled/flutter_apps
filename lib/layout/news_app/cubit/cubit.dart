import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/layout/news_app/cubit/states.dart';
import 'package:flutter_app_1/modules/business/business_screen.dart';
import 'package:flutter_app_1/modules/science/sience_screen.dart';
import 'package:flutter_app_1/modules/settings/settings_screen.dart';
import 'package:flutter_app_1/modules/sports/sports_screen.dart';
import 'package:flutter_app_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int index = 0;
  List<BottomNavigationBarItem> buttomItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Besiness',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sport',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),

  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];

  void changeBottomIndex(value){
    index = value;
    emit(NewsChangeBottomIndex());
  }

  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];

  void getBuseniss(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country': 'us',
          'category': 'business',
          'apiKey': 'cb55b2e91ef54db7845e76de69ab10fd'
        }
    ).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }
    ).catchError((error) {
      print(error);
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  void getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:{
          'country': 'us',
          'category': 'sports',
          'apiKey': 'cb55b2e91ef54db7845e76de69ab10fd'
        }
    ).then((value) {
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }
    ).catchError((error) {
      print(error);
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'cb55b2e91ef54db7845e76de69ab10fd'
        }
    ).then((value) {
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError(
            (error){
              emit(NewsGetScienceErrorState(error));
            });
  }

}