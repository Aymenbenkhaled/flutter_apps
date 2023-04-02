import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text(
          'My First App'
        ),
        actions: [
          IconButton(
            onPressed: (){
              print('Button clicked');
            },
            icon: Icon(
              Icons.notification_important,
            ),),
          IconButton(
              onPressed: (){},
              icon: Text(
                'AAA'
              ),),
        ],
      ),
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topStart: Radius.circular(30)
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                      image: AssetImage('images/img.jpg'),
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                  ),
                  Container(
                    color: Colors.lightBlueAccent.withOpacity(.26),
                    width: 200.0,
                    padding: EdgeInsets.symmetric(
                        vertical: 3,
                    ),
                    child: Text(
                      'Flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
  
}