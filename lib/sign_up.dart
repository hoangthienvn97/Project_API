import 'package:flutter/material.dart';
import 'package:project_api/common/pwd_field.dart';
import 'package:project_api/value/strings.dart';
import 'api/api.dart';
import 'login_page.dart';

class Signup extends StatefulWidget {
  static String tag = 'signup-page';
  final String email;

  Signup(@required this.email);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  Api _api = Api();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  TextEditingController _userController = TextEditingController();
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
      controller: _userController,
      decoration: InputDecoration(
        hintText: Strings.signup_page_username,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    
    final signupButton = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      onPressed: () async {
        await _api.signUp(
          gmail: _emailController.text,
          password: _passController.text,
          user: _userController.text,
          onError: (error){},
          onSusses: (token){
            Navigator.of(context).pushNamed(LoginPage.tag);
          }
        );
      },
      padding: EdgeInsets.all(12),
      color: Colors.blue[300],
      child: Text(
        Strings.signup_page_reg,
        style: TextStyle(color: Colors.white, fontSize: 17.0),
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
              Padding(padding: const EdgeInsets.only(top:0), child: email),
              Padding(padding: const EdgeInsets.only(top: 20), child:PwdField(_passController)),
              Padding(padding: const EdgeInsets.only(top: 20), child: PwdField(_confirmController, type: PwdType.confirm)),
              Padding(padding: const EdgeInsets.only(top: 20), child: username),
              Padding(
                  padding: const EdgeInsets.only(top: 25), child: signupButton),
            ],
          ),
        ));
  }
}
