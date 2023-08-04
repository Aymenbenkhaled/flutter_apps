import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20,
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('images/img2.jpg'),
            ),
            SizedBox(width: 15),
            Text(
              'Chats',
              style: TextStyle(
                color: Colors.black,

              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.camera_alt,
                  size: 16,
                  color: Colors.white,
                ),
              ),
          ),
          IconButton(
              onPressed: (){},
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.edit,
                  size: 16,
                  color: Colors.white,
                ),
              )
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Search'
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 105,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildStoryItem(),
                  itemCount: 8,
                ),
              ),
              SizedBox(height: 10,),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemBuilder: (context, index) => buildChatItem(),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
                  itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatItem() => Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('images/img2.jpg'),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 2,
              end: 2,
            ),
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.green,
            ),
          ),
        ],
      ),
      SizedBox(width: 10,),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Benkhaled Aymen',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'hhhhhhhh yawedi ghi sbor rani jay oui',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 5,
                  ),
                  child: Container(
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '11:22 am',
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
  Widget buildStoryItem() => Container(
    width: 60,
    child: Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('images/img2.jpg'),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 2,
                  bottom: 2
              ),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 8,
              ),
            ),
          ],
        ),
        SizedBox(height: 5,),
        Text(
          'Benkhaled Aymen',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );

}
