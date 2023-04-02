import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter=1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter',
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                  });
                  counter--;
                  print(counter);
                },
                child: Text(
                  'Mins'
                ),
            ),
            Text(
              '$counter',
              style: TextStyle(
                fontSize: 50
                  ,
                fontWeight: FontWeight.w600
              ),
            ),
            TextButton(
                onPressed:() {
                  setState(() {

                  });
                  counter++;
                  print(counter);
                },
                child: Text(
                  'plus'
                ),
            ),
          ],
        ),
      ),
    );
  }
}
