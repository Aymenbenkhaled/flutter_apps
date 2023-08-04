import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app_1/layout/news_app/cubit/states.dart';
import 'package:flutter_app_1/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Search',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          body: Column(
            children: [
              defaultFormField(
                controller: textController,
                type: TextInputType.text,
                label: 'Search',
                prefIcon: Icons.search,
                radius: 20,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Search Must Not Be Empty';
                  }
                },
                onChange: (value) {
                  cubit.getSearch(value);
                } ,
              ),
              Expanded(
                child: ConditionalBuilder(
                  condition: cubit.list.length>0,
                  builder: (BuildContext context) {
                    return  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index) {
                          return buildArticleItem(cubit.list[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) => buildSeparator(),
                        itemCount: cubit.list.length,
                      ),
                    );
                  },
                  fallback: (context) {
                    return Center(child: CircularProgressIndicator());
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
