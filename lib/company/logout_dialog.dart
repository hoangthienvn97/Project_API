import 'package:flutter/material.dart';
import 'package:project_api/login_page.dart';
import 'package:project_api/value/strings.dart';

class LogoutDialog extends StatelessWidget {
  final Function logout;
  LogoutDialog({this.logout});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: size.width * (1 / 3),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 16, left: 12, right: 12),
              child: Text(
                Strings.logout_dialog_text_1,
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 16, left: 12, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(Strings.logout_dialog_text_2,
                          style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(
                        Strings.logout_dialog_text_3,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
