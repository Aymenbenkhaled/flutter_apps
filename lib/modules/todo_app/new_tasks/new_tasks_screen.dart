import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/shared/components/components.dart';
import 'package:flutter_app_1/shared/cubit/cubit.dart';
import 'package:flutter_app_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, state) {
        AppCubit cubit = AppCubit.get(context);
        return cubit.newTasks.length > 0 ?
        ListView.separated(
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(start: 20.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[400],
              ),
            ),
            itemCount: cubit.newTasks.length,
            itemBuilder: (context, index) => buildTaskItem(cubit.newTasks[index]))
            :
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.menu,size: 70,),
              Text(
                'No Tasks Yet, Please Add Some Tasks',
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
