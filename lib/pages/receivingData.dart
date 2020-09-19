import 'package:flutter/material.dart';
import 'package:myprofile_flutter_app/pages/profile.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ReceivingData extends StatefulWidget {
  @override
  _ReceivingDataState createState() => _ReceivingDataState();
}

class _ReceivingDataState extends State<ReceivingData> {

  void receivingProfile() async {
    Profile profile_1 = Profile(
        name: 'Adrian Yim',
        phone: '(208)206-5039',
        email: 'adrianyim@gmail.com',
        bio: 'Hi my name is Adrian Yim. I am from Hong Kong. '
            'I graduated in B.S. Software Engineering at Brigham Young University '
            '- Idaho in July 2020.');

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'name': profile_1.name,
      'phone': profile_1.phone,
      'email': profile_1.email,
      'bio': profile_1.bio,
    });
  }

  @override
  void initState() {
    super.initState();
    receivingProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: Center(
            child: SpinKitFadingCube(
              color: Colors.white,
              size: 50.0,
            )
        )
    );
  }
}
