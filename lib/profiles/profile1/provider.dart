import 'package:flutter_ui1/profiles/profile1/user.dart';


class Profile1Provider{

  static Profile getProfile(){

    return Profile(
      user: User(
          name: 'Khalid Alzamly',
          address: '27 Kirkuk 1',
          about: "A computer programmer, sometimes called only programmer or more recently a coder (especially in more informal contexts), is a person who creates computer software. The term computer programmer can refer to a specialist in one area of computers, or to a generalist who writes code for many kinds of software."
      ),
      followers: 2318,
      following: 364,
      friends: 175
    );


  }

}
