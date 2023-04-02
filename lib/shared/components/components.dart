import 'package:flutter/material.dart';

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


Widget buildTaskItem(Map modal){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            '${modal['time']}',
          ),
        ),
        SizedBox(width: 10,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '${modal['title']}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),Text(
              '${modal['date']}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
