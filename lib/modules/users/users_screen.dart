import 'package:flutter/material.dart';

import '../../models/user/user_model.dart';


class UsersScreen extends StatelessWidget
{
  List<UserModel> users = [
    UserModel(
        id: 1,
        name: 'Benkhaled Aymen',
        phone: '+213676655443',
    ),
    UserModel(
      id: 2,
      name: 'Belazzouz Abderrahmen',
      phone: '+213778866545',
    ),
    UserModel(
      id: 3,
      name: 'Benkhaled Oussama',
      phone: '+213660546677',
    ),
    UserModel(
      id: 1,
      name: 'Benkhaled Aymen',
      phone: '+213676655443',
    ),
    UserModel(
      id: 2,
      name: 'Belazzouz Abderrahmen',
      phone: '+213778866545',
    ),
    UserModel(
      id: 3,
      name: 'Benkhaled Oussama',
      phone: '+213660546677',
    ),
    UserModel(
      id: 1,
      name: 'Benkhaled Aymen',
      phone: '+213676655443',
    ),
    UserModel(
      id: 2,
      name: 'Belazzouz Abderrahmen',
      phone: '+213778866545',
    ),
    UserModel(
      id: 3,
      name: 'Benkhaled Oussama',
      phone: '+213660546677',
    ),
    UserModel(
      id: 1,
      name: 'Benkhaled Aymen',
      phone: '+213676655443',
    ),
    UserModel(
      id: 2,
      name: 'Belazzouz Abderrahmen',
      phone: '+213778866545',
    ),
    UserModel(
      id: 3,
      name: 'Benkhaled Oussama',
      phone: '+213660546677',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
        ),
      ),
      body:  ListView.separated(
          itemBuilder: (UserModel , index) => buildUsersItem(users[index]),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 20),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.black12,
            ),
          ),
          itemCount: users.length,
      ),

    );
  }

  Widget buildUsersItem(UserModel user) => Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 30,
          child: Text(
            '${user.id}',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(width: 20,),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${user.name}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
              ),
            ),
            Text(
              '${user.phone}',
              style: TextStyle(
                color: Colors.grey[700]
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
