import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  static final FacebookLogin facebookSignIn = new FacebookLogin();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: [
          TextButton(
            child: Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              final FacebookLoginResult result =
                  await facebookSignIn.logIn(['email']);

              switch (result.status) {
                case FacebookLoginStatus.loggedIn:
                  final FacebookAccessToken accessToken = result.accessToken;
                  print('''
         Logged in!
         
         Token: ${accessToken.token}
         User id: ${accessToken.userId}
         Expires: ${accessToken.expires}
         Permissions: ${accessToken.permissions}
         Declined permissions: ${accessToken.declinedPermissions}
         ''');
                  break;
                case FacebookLoginStatus.cancelledByUser:
                  print('Login cancelled by the user.');
                  break;
                case FacebookLoginStatus.error:
                  print('Something went wrong with the login process.\n'
                      'Here\'s the error Facebook gave us: ${result.errorMessage}');
                  break;
              }
            },
          )
        ],
      ),
    );
  }
}