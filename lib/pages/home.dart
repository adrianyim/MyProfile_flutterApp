import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {'name': 'Adrian Yim',
    'phone': '(208)206-5039',
    'email': 'adrianyim@gmail.com',
    'bio': 'Hi my name is Adrian Yim. I am from Hong Kong. '
        'I graduated in B.S. Software Engineering at Brigham Young University '
        '- Idaho in July 2020.',
    'image': 'assets/profile_1.jpg'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
            child: Column(
              children: [
                Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 26.0,
                    color: Colors.blue[600],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
              InkWell(
                onTap: () async {
                  dynamic result = await Navigator.pushNamed(context, '/updateProfileImage', arguments: {
                    'image': data['image']
                  });

                  setState(() {
                    data = {
                      'name': data['name'],
                      'phone': data['phone'],
                      'email': data['email'],
                      'bio': data['bio'],
                      'image': result['image']
                    };
                  });
                },
                child: Stack(children: [
                  CircleAvatar(
                    radius: 65.0,
                    backgroundColor: Colors.blue[600],
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('${data['image']}'),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 0,
                    child: CircleAvatar(
                        radius: 18.0,
                        backgroundColor: Colors.white
                    ),
                  ),
                  Positioned(
                      top: 15,
                      right: 5,
                      child: Icon(
                        Icons.edit,
                        color: Colors.blue[600],
                        size: 23.0,
                      )
                  ),
                ]),
              ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['name'],
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[500],
                          size: 20.0,
                        ),
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/updateName', arguments: {
                            'name': data['name'],
                          });

                          setState(() {
                            data = {
                              'name': result['name'],
                              'phone': data['phone'],
                              'email': data['email'],
                              'bio': data['bio'],
                              'image': data['image']
                            };
                          });
                          },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[800],
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['phone'],
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey[500],
                            size: 20.0,
                        ),
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/updatePhone', arguments: {
                            'phone': data['phone'],
                          });

                          setState(() {
                            data = {
                              'name': data['name'],
                              'phone': result['phone'],
                              'email': data['email'],
                              'bio': data['bio'],
                              'image': data['image']
                            };
                          });
                        },
                        ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[800],
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      data['email'],
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[500],
                          size: 20.0,
                        ),
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/updateEmail', arguments: {
                            'email': data['email'],
                          });

                          setState(() {
                            data = {
                              'name': data['name'],
                              'phone': data['phone'],
                              'email': result['email'],
                              'bio': data['bio'],
                              'image': data['image']
                            };
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[800],
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text(
                      'Tell us about yourself',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        data['bio'],
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 3,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                      width: 30.0,
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey[500],
                          size: 20.0,
                        ),
                        onPressed: () async {
                          dynamic result = await Navigator.pushNamed(context, '/updateBio', arguments: {
                            'bio': data['bio'],
                          });

                          setState(() {
                            data = {
                              'name': data['name'],
                              'phone': data['phone'],
                              'email': data['email'],
                              'bio': result['bio'],
                              'image': data['image']
                            };
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey[800],
                  height: 20.0,
                ),
              ]
            )
          );
        }
      )
    );
  }
}
