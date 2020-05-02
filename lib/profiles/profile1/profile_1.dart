import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'user.dart';
import 'provider.dart';

class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {

  Profile profile = Profile1Provider.getProfile();

  static Color _textColor = Color(0xFF4a4a4a);

  @override
  Widget build(BuildContext context) {

    return Theme(
      data: ThemeData(
        fontFamily: 'SFDisplay'
      ),
      child: Stack(
        children: <Widget>[
          Image.asset(
            'assets/profiles/landscape_1.jpg',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.45,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "PROFILE",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: Icon( FontAwesomeIcons.bars ),
                  onPressed: (){}
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(FontAwesomeIcons.cog),
                    onPressed: (){}
                )
              ],
            ),
            body: Stack(
              children: <Widget>[
                CustomPaint(
                  painter: ProfilePainter(),
                  child: Container(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.23,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: ExactAssetImage('assets/shared/profile.png'),
                  ),
                ),
                _bodyText(context),
                _bottomBar(context),
              ],
            ),
          ),

        ],
      ),
    );


  }

  TextStyle _bottomBarTitle = TextStyle(
    color: Colors.grey.shade400,
  );

  TextStyle _bottomBarCounter = TextStyle(
    color: _textColor,
    fontSize: 22,
    fontWeight: FontWeight.bold
  );

  Widget _bottomBar(BuildContext context) {
    return Positioned(
      bottom: 35,
      left: 24,
      right: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                  'FOLLOWERS',
                style: _bottomBarTitle,
              ),
              SizedBox(height: 8,),
              Text(
                  profile.followers.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                  'FOLLOWING',
                style: _bottomBarTitle,
              ),
              SizedBox(height: 8,),
              Text(
                  profile.following.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                  'FRIENDS',
                style: _bottomBarTitle,
              ),
              SizedBox(height: 8,),
              Text(
                  profile.friends.toString(),
                style: _bottomBarCounter,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bodyText(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.35,
      bottom: 0,
      right: 24,
      left: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text(
                profile.user.name,
              style: TextStyle(
                color: _textColor,
                fontWeight: FontWeight.w900,
                fontSize: 32.0
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.location_on, color: Colors.grey.shade400,),
              Text(
                  profile.user.address,
                style: TextStyle(
                  color: _textColor,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
                'ABOUT ME',
              style: TextStyle(
                color: Colors.grey.shade400
              ),
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                profile.user.about,
                softWrap: true,
                style: TextStyle(
                  color: _textColor,
                  fontSize: 17,
                  height: 1.1,
                  letterSpacing: 1.1
                ),
              )
          ),

        ],
      ),
    );
  }
}


class ProfilePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {

    Path path = Path();
    Paint paint = Paint();
    paint.color = Colors.white;
    path.lineTo( 0 , size.height * 0.33 );
    path.lineTo(size.width , size.height * 0.37);
    path.lineTo(size.width , size.height);
    path.lineTo(0 , size.height);
    path.lineTo(0 , size.height * 0.35);
    path.close();
    canvas.drawPath(path, paint);

    //canvas.clipPath(path);
    canvas.drawColor(Colors.white, BlendMode.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

}
