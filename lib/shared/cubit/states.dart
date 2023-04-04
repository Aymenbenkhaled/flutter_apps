import 'package:flutter_app_1/shared/cubit/cubit.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppChangeIndexState extends AppStates {}

class AppCreateDbState extends AppStates {}

class AppInsertToDbState extends AppStates {}

class AppGetFromDbState extends AppStates {}

class AppChageBottomSheetState extends AppStates{}

class AppUpdateDataFromDbState extends AppStates{}

class AppDeleteDataFromDbState extends AppStates{}

class AppLoadingState extends AppStates{}


