import 'package:flutter/material.dart';

class UpdateBio extends StatefulWidget {
  @override
  _UpdateBioState createState() => _UpdateBioState();
}

class _UpdateBioState extends State<UpdateBio> {

  TextEditingController bioController = TextEditingController();
  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;
    bioController.text = data['bio'].trim();

    void updateBio(TextEditingController bio) {

      Navigator.pop(context, {
        'bio': bio.text,
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
                  "What type of passenger are you?",
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
                        controller: bioController,
                        decoration: InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          hintText: 'Write a little bit about yourself. Do you like chatting? Are you a smoker? Do you bring pets with you? Etc.',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                          ),
                        ),
                        maxLines: 6,
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
                      updateBio(bioController);
                    },
                    color: Colors.black,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
