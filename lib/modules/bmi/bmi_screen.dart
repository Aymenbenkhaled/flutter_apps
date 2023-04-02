import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_1/modules/bmi_result/bmi_result_screen.dart';

class BmiScreen extends StatefulWidget
{

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen>
{
  var result;
  bool isMale =true;
  double height = 120;
  int weight = 40;
  int age = 20;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bmi Calculator',
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/male.png',),
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'MALE',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isMale ? Colors.blue : Colors.grey[400],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false ;
                          });
                        },
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                                height: 90,
                                width: 90,
                              ),
                              SizedBox(height: 10,),
                              Text(
                                'FEMALE',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: isMale ? Colors.grey[400] : Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[400],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${height.round()}',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            'CM',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                          value: height,
                          min: 80,
                          max: 220,
                          onChanged: (value) {
                            setState(() {
                              height = value;
                            });
                          },
                      ),
                    ],
                  ),
                ),
              ),
          ),
          Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                    heroTag: 'age-',
                                    mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                ),
                                FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                    heroTag: 'age+',
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[400]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  heroTag: 'weight-',
                                    mini: true,
                                    child: Icon(
                                      Icons.remove,
                                    ),
                                ),
                                FloatingActionButton(
                                    onPressed: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  heroTag: 'weight+',
                                    mini: true,
                                    child: Icon(
                                      Icons.add,
                                    ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              height: 50,
              onPressed: () =>
              {
                result = weight / pow(height/100,2),
                print(result),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context) => BmiResultScreen(
                          age: age,
                          isMale: isMale,
                          result: result.round(),
                        ),
                    ),
                ),
              },
              child: Text(
                'CALCULATE',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
