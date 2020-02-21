import 'package:flutter/material.dart';
import 'package:project_api/value/strings.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: Image.asset('images/wisami.jpg'),
      ),
    );
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: Strings.forget_password_page_email,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () {},
      padding: EdgeInsets.all(12),
      color: Colors.green,
      child: Text(
        Strings.forgetPassword,
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
              logo,
              Padding(padding: const EdgeInsets.only(top: 48), child: email),
              Padding(
                  padding: const EdgeInsets.only(top: 48), child: loginButton),
            ],
          ),
        ));
  }
}
