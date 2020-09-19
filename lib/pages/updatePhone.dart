import 'package:flutter/material.dart';

class UpdatePhone extends StatefulWidget {
  @override
  _UpdatePhoneState createState() => _UpdatePhoneState();
}

class _UpdatePhoneState extends State<UpdatePhone> {

  TextEditingController phoneController = TextEditingController();
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    phoneController.text = data['phone'].trim();

    void updatePhone(TextEditingController phone) {

      Navigator.pop(context, {
        'phone': phone.text,
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
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's your phone number?",
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
                          controller: phoneController,
                          decoration: InputDecoration(
                            labelText: 'Your phone number',
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
                        updatePhone(phoneController);
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
