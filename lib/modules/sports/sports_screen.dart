import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app_1/layout/news_app/cubit/states.dart';
import 'package:flutter_app_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.sports.length>0,
          builder:(context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, int index) => buildArticleItem(cubit.sports[index]),
            separatorBuilder: (BuildContext context, int index) => buildSeparator(),
            itemCount: cubit.sports.length,
          ),
          fallback:(context) => Center(child: CircularProgressIndicator()),
        );


      },
    );
  }
}
