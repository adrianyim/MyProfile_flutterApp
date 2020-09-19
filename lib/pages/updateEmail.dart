import 'package:flutter/material.dart';

class UpdateEmail extends StatefulWidget {
  @override
  _UpdateEmailState createState() => _UpdateEmailState();
}

class _UpdateEmailState extends State<UpdateEmail> {

  TextEditingController emailController = TextEditingController();
  Map data = {};
  bool _autoValidate = false;
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    emailController.text = data['email'];

    void updateEmail(TextEditingController email) {

      if (_key.currentState.validate()) {
        // _key.currentState.save();
        Navigator.pop(context, {
          'email': email.text,
        });
      } else {
        setState(() {
          _autoValidate = true;
        });
      }
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
                    "What's your phone email?",
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
                        child: Form(
                          key: _key,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'Your email address',
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
                            keyboardType: TextInputType.emailAddress,
                            autovalidate: _autoValidate,
                            validator: emailValidator,
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
                        updateEmail(emailController);
                      },
                      color: Colors.black,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          }
      )
    );
  }
}

String emailValidator(String value) {
  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return 'Invalid input';
  }
  return null;
}