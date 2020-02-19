import 'package:flutter/material.dart';

class ForeignPassword extends StatefulWidget {
  @override
  _ForeignPasswordState createState() => _ForeignPasswordState();
}

class _ForeignPasswordState extends State<ForeignPassword> {
  @override
  Widget build(BuildContext context){
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
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape : RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: (){

        },
        padding: EdgeInsets.all(12),
        color: Colors.green,
        child: Text('KHÔI PHỤC MẬT KHẨU', style: TextStyle(color: Colors.white, fontSize: 17.0),),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body : Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 50.0),
            email,
            SizedBox(height: 15.0),
            loginButton,
          ],
        ),
      )
    );

  }
}
