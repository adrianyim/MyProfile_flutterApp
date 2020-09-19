import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UpdateProfileImage extends StatefulWidget {
  @override
  _UpdateProfileImageState createState() => _UpdateProfileImageState();
}

class _UpdateProfileImageState extends State<UpdateProfileImage> {

  Map data = {};

  PickedFile pickedFile;
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    void updateImage(PickedFile pickedFile) {

      Navigator.pop(context, {
        'image': pickedFile.path,
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
                      "Upload a photo of yourself:",
                      style: TextStyle(
                        fontSize: 26.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.0),
                    // IconButton(
                    //   icon: Icon(
                    //       Icons.add_to_photos,
                    //       color: Colors.grey[500],
                    //       size: 20.0),
                    //   onPressed: () async {
                    //     final _pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
                    //
                    //     setState(() {
                    //       pickedFile = _pickedFile;
                    //     });
                    //   },
                    // ),
                    InkWell(
                      onTap: () async {
                        final _pickedFile = await imagePicker.getImage(source: ImageSource.gallery);

                        setState(() {
                          pickedFile = _pickedFile;
                        });
                      },
                      child: Image(
                        image: pickedFile == null? AssetImage('${data['image']}') : FileImage(File(pickedFile.path)),
                        width: 500.0,
                        height: 500.0,
                      ),
                    ),
                    SizedBox(height: 80.0),
                    ButtonTheme(
                      height: 60.0,
                      minWidth: 1000.0,
                      child: RaisedButton(
                        child: Text('Update'),
                        onPressed: () {
                          updateImage(pickedFile);
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
