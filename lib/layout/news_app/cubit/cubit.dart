
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/layout/news_app/cubit/states.dart';
import 'package:flutter_app_1/modules/news_app/business/business_screen.dart';
import 'package:flutter_app_1/modules/news_app/science/sience_screen.dart';
import 'package:flutter_app_1/modules/news_app/settings/settings_screen.dart';
import 'package:flutter_app_1/modules/news_app/sports/sports_screen.dart';
import 'package:flutter_app_1/shared/network/local/cache_helper.dart';
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
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomIndex(value){
    index = value;
    emit(NewsChangeBottomIndex());
  }

  List<dynamic> business=[];
  List<dynamic> sports=[];
  List<dynamic> science=[];

  List<dynamic> list = [];

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
              emit(NewsGetScienceErrorState(error.toString()));
            });
  }

  void getSearch(searchValue){
    emit(NewsGetSearchLoadingState());
    list = [];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$searchValue',
          'apiKey': 'cb55b2e91ef54db7845e76de69ab10fd'
        }
    ).then((value) {
      list = value.data['articles'];
      print(list);
      emit(NewsGetSearchSuccessState());
    }).catchError(
            (error){
              emit(NewsGetSearchErrorState());
            });
  }

  bool darkLight = true;

  void changeDarkLight(){
    darkLight = !darkLight;
    CacheHelper.putData(key: 'DarkLight', value: darkLight);
    emit(NewsChangeDarkLightState());
  }

}