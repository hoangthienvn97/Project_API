import 'package:flutter/material.dart';
import 'package:project_api/company/logout_dialog.dart';
import 'package:project_api/value/strings.dart';
import './create_company.dart';

class SelectCompany extends StatefulWidget {
  @override
  _SelectCompanyState createState() => _SelectCompanyState();
}

class _SelectCompanyState extends State<SelectCompany> {
  List<String> datas = ["NovaLab", "LiyaLab", 'CodePSoft'];

  @override
  Widget build(BuildContext context) {
    Widget textTop = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Text(
        Strings.select_cpny_textTop,
        style: new TextStyle(fontSize: 16.0, color: Colors.grey[850]),
      ),
    );
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(Strings.select_cpny_title),
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.backspace),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return LogoutDialog(
                        logout: () {
                          //dismiss dialog
                          Navigator.of(context).pop();
                          //handle logout event
                        },
                      );
                    });
              },
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: textTop,
              ),
              Expanded(
                flex: 4,
                child: ListView(
                    children: datas
                        .asMap()
                        .map(
                          (index, value) => MapEntry(
                            index,
                            ListTile(
                              leading: Icon(Icons.people),
                              trailing: Icon(Icons.arrow_right),
                              title: Text(value),
                              onTap: () {
                                print("$value");
                              },
                            ),
                          ),
                        )
                        .values
                        .toList()),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(Strings.select_cpny_or.toUpperCase()),
                      FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CreateNewCompany()),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.blue, width: 1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: Center(
                                  child: Text(
                                    Strings.select_cpny_button.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.purple, fontSize: 15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Text(
                        Strings.select_cpny_text,
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
