import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/news_app/search/search_screen.dart';
import 'package:flutter_app_1/shared/components/components.dart';
import 'package:flutter_app_1/shared/network/local/cache_helper.dart';
import 'package:flutter_app_1/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navPush(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {
                  cubit.changeDarkLight();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.index,
            onTap: (value) {
              cubit.changeBottomIndex(value);
            },
            items: cubit.buttomItem,
          ),
        );
      },
    );
  }
}
