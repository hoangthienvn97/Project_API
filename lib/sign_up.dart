import 'package:flutter/material.dart';
import 'package:project_api/common/pwd_field.dart';
import 'package:project_api/value/strings.dart';
import 'login_page.dart';

class Signup extends StatefulWidget {
  static String tag = 'signup-page';
  final String email;

  Signup(@required this.email);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
        hintText: Strings.signup_page_email,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final username = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: Strings.signup_page_username,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final signupButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(LoginPage.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text(
          Strings.signup_page_reg,
          style: TextStyle(color: Colors.white, fontSize: 17.0),
        ),
      ),
    );
    TextEditingController _confirmController = TextEditingController();
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
              PwdField(_passController),
              SizedBox(height: 24.0),
              PwdField(_confirmController, type: PwdType.confirm),
              SizedBox(height: 24.0),
              username,
              SizedBox(height: 15.0),
              signupButton,
            ],
          ),
        ));
  }
}
