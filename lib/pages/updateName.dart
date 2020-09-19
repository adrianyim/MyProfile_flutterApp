import 'package:flutter/material.dart';

class UpdateName extends StatefulWidget {
  @override
  _UpdateNameState createState() => _UpdateNameState();
}

class _UpdateNameState extends State<UpdateName> {

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    List<String> fullName = data['name'].trim().split(" ");

    String lastName = fullName[fullName.length - 1];
    String firstName = '';

    for (int i = 0; i < fullName.length - 1; i++) {
      if (i == fullName.length - 2) {
        firstName += fullName[i];
      }
      else {
        firstName += fullName[i] + ' ';
      }
    }

    firstNameController.text = firstName;
    lastNameController.text = lastName;

    void updateName(TextEditingController firstName, TextEditingController lastName) {

      String name = firstName.text + ' ' + lastName.text;

      Navigator.pop(context, {
        'name': name,
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index){
            return Container(
              padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's your name?",
                    style: TextStyle(
                      fontSize: 26.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: firstNameController,
                          decoration: InputDecoration(
                            labelText: 'First Name',
                            labelStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),

                        ),
                      ),
                      SizedBox(width: 20.0),
                      Expanded(
                        child: TextFormField(
                          controller: lastNameController,
                          decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                              fontSize: 16.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 200.0),
                  ButtonTheme(
                    height: 60.0,
                    minWidth: 1000.0,
                    child: RaisedButton(
                      child: Text('Update'),
                      onPressed: () {
                        updateName(firstNameController, lastNameController);
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          })
    );
  }
}
