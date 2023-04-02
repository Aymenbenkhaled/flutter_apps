import 'package:flutter/material.dart';
import 'package:flutter_app_1/shared/components/components.dart';

import '../../shared/components/constants.dart';

class NewTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(start: 20.0),
          child: Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[400],
          ),
        ),
        itemCount: tasks.length,
        itemBuilder: (context, index) => buildTaskItem(tasks[index]));
  }
}
