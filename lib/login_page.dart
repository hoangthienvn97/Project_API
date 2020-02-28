import 'package:flutter/material.dart';
import 'package:project_api/api/api.dart';
import 'package:project_api/value/strings.dart';
import 'login_password.dart';
import 'sign_up.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Api _api = Api();
  bool _isBusy = false;
  TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: Strings.login_page_login_title,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final loginButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () async {
        await _api.checkingUser(
            gmail: _emailController.text,
            onError: (error) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signup(_emailController.text.trim())),
              );
            },
            onSusses: (result) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                    LoginPagePassword(_emailController.text.trim())),
              );
            });
      },
      padding: EdgeInsets.all(12),
      color: Colors.blue[300],
      child: Text(
        Strings.login_page_continue,
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 48), child: email),
              Padding(
                  padding: const EdgeInsets.only(top: 48), child: loginButton),
            ],
          ),
        ));
  }
}
