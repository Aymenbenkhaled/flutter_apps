import 'package:flutter/material.dart';
import 'package:flutter_app_1/layout/news_app/cubit/cubit.dart';
import 'package:flutter_app_1/layout/news_app/cubit/states.dart';
import 'package:flutter_app_1/shared/cubit/cubit.dart';
import 'package:flutter_app_1/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget defaultBotton({
  double width = 200,
  double radius = 30,
  Color background = Colors.lightBlueAccent,
  bool isUpperCase = true,
  required Function function,
  required String text,
  Color color = Colors.white,
}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: MaterialButton(
        onPressed: () {
          function();
        },
        //(){print('${emailController.text} //// ${passwordController.text} ' );},
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required String label,
  double radius = 0,
  required IconData prefIcon,
  IconData? suffIcon,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  Function()? onTap,
  required String? Function(String?)? validate,
  bool obscureText = false,
  Function()? suffpressd,
  //required String text,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: validate,
      obscureText: obscureText,
      onTap: onTap,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefIcon,
        ),
        suffixIcon: IconButton(
          onPressed: suffpressd,
          icon: Icon(
            suffIcon,
          ),
        ),
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );

Widget buildTaskItem(Map modal) {
  return BlocConsumer<AppCubit, AppStates>(
    listener: (BuildContext context, state) {},
    builder: (BuildContext context, state) {
      AppCubit cubit = AppCubit.get(context);
      return Dismissible(
        key: Key(modal['id'].toString()),
        onDismissed: (direction) {
          cubit.deleteDataFromDb(id: modal['id']);
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                child: Text(
                  '${modal['time']}',
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${modal['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${modal['date']}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    cubit.updateDataFromDb(status: 'done', id: modal['id']);
                  },
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                    size: 35,
                  )),
              SizedBox(
                width: 20,
              ),
              IconButton(
                  onPressed: () {
                    cubit.updateDataFromDb(status: 'archived', id: modal['id']);
                  },
                  icon: Icon(
                    Icons.archive,
                    size: 35,
                  )),
            ],
          ),
        ),
      );
    },
  );
}

Widget buildSeparator() {
  return Padding(
    padding: const EdgeInsetsDirectional.only(start: 20),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey[500],
    ),
  );
}

Widget buildArticleItem(article) {
  return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ImageProvider img;
        article['urlToImage'] == null
            ? img = AssetImage('assets/images/img2.jpg')
            : img = NetworkImage('${article['urlToImage']}');
        var cubit = NewsCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: img,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          '${article['title']}',
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 3,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        '${article['publishedAt'].toString()}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      });
}
