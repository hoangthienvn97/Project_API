import 'package:flutter/material.dart';
import 'login_password.dart';
import 'sign_up.dart';
// import 'package:login_registration/signup.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


String _emailDefault = 'abc@gmail.com';
TextEditingController _emailController = TextEditingController();

@override
  void initState() {
    _emailController.text = _emailDefault;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Xin nhập email hoặc Tên đăng nhập',
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
          if(_emailController.text == "abc@gmail.com"){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPagePassword(_emailController.text.trim())),
            );
          }
          else{
             Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Signup(_emailController.text.trim())),
            );
          }

        },
        padding: EdgeInsets.all(12),
        color: Colors.blue[300],
        child: Text(
          'TIẾP TỤC',
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );

    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              // logo,
              // SizedBox(height: 50.0),
              email,
              SizedBox(height: 15.0),
              loginButton,
            ],
          ),
        ));
  }
}