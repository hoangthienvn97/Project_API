import 'package:flutter/material.dart';
import 'package:project_api/value/strings.dart';
import 'foreign_password.dart';
import './company/select_company.dart';

class LoginPagePassword extends StatefulWidget {
  final String email;

  LoginPagePassword(@required this.email);

  @override
  _LoginPagePasswordState createState() => _LoginPagePasswordState();
}

class _LoginPagePasswordState extends State<LoginPagePassword> {
  String _passDefauld = '12345678';
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  void initState() {
    _emailController.text = widget.email;
    super.initState();
  }

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
      controller: _emailController,
      decoration: InputDecoration(
        hintText: Strings.login_pwd_email,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final password = TextFormField(
      autofocus: false,
      controller: _passController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: Strings.login_pwd_pwd,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          if (_passController.text == "12345678") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectCompany(),
                ));
          } else {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Thông báo'),
                    content: const Text('Sai mật khẩu đăng nhập'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text(
          Strings.login_pwd_signin,
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
    final forgotLabel = FlatButton(
      child: Text(
        Strings.login_pwd_forget_pwd,
        style: TextStyle(color: Colors.purple, fontSize: 15),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgetPassword()),
        );
      },
    );
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 50.0),
              email,
              SizedBox(height: 15.0),
              password,
              SizedBox(height: 24.0),
              loginButton,
              forgotLabel
            ],
          ),
        ));
  }
}
