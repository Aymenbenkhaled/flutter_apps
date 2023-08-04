import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget
{
  final int result;
  final bool isMale;
  final int age;

  BmiResultScreen({
    required this.age,
    required this.isMale,
    required this.result,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        title: Text(
          'BMI Results',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender : ${isMale ? 'Male': 'Female' } ',
              style: TextStyle(
                fontSize:25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Results : $result',
              style: TextStyle(
                fontSize:25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontSize:25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
