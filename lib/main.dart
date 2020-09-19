import 'package:flutter/material.dart';
import 'package:myprofile_flutter_app/pages/home.dart';
import 'package:myprofile_flutter_app/pages/updateName.dart';
import 'package:myprofile_flutter_app/pages/updatePhone.dart';
import 'package:myprofile_flutter_app/pages/updateEmail.dart';
import 'package:myprofile_flutter_app/pages/updateBio.dart';
import 'package:myprofile_flutter_app/pages/updateProfileImage.dart';

void main()  => runApp(MaterialApp(
  // initialRoute: '/receivingData',
  routes: {
    '/': (context) => Home(),
    // '/receivingData': (context) => ReceivingData(),
    '/updateName': (context) => UpdateName(),
    '/updatePhone': (context) => UpdatePhone(),
    '/updateEmail': (context) => UpdateEmail(),
    '/updateBio': (context) => UpdateBio(),
    '/updateProfileImage': (context) => UpdateProfileImage(),
  },
));