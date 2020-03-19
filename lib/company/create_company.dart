import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_api/value/strings.dart';

class CreateNewCompany extends StatefulWidget {
  @override
  _CreateNewCompanyState createState() => _CreateNewCompanyState();
}

class _CreateNewCompanyState extends State<CreateNewCompany> {
  File _image;
  Future selectImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget addLogo = GestureDetector(
      onTap: () {
        selectImage();
      },
      child: Container(
        padding: EdgeInsets.all(32),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Colors.grey.withOpacity(0.4)),
        child: Icon(Icons.add),
      ),
    );

    final logo_circle = Hero(
      tag: "logo_hero",
      child: GestureDetector(
        onTap: selectImage,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 64),
            decoration:
                BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            child: _image == null
                ? addLogo
                : Container(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill, image: FileImage(_image))),
                      ),
                    ),
                  )),
      ),
    );

    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 70.0,
        child: _image == null ? addLogo : Image.file(_image),
      ),
    );

    final nameCompany = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: Strings.create_cpny_name_cpny,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final phoneNumber = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: Strings.create_cpny_phone_cpny,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final button = RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      //TODO
      // onPressed: () {},
      padding: EdgeInsets.all(12),
      color: Colors.blue[300],
      child: Text(
        Strings.create_cpny_continue,
        style: TextStyle(color: Colors.white, fontSize: 17.0),
      ),
    );
    Widget textBottom = new Container(
      padding: const EdgeInsets.all(10.0),
      child: new Text(
        Strings.create_cpny_title_bottom,
        style: new TextStyle(fontSize: 16.0, color: Colors.grey[850]),
      ),
    );
    return Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(
              icon: new Icon(Icons.arrow_left),
              onPressed: null,
            )
          ],
          title: new Text(Strings.create_cpny_btn),
        ),
        backgroundColor: Colors.white,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo_circle,
              SizedBox(height: 50.0),
              Padding(padding: const EdgeInsets.only(top: 48), child: nameCompany),
              Padding(padding: const EdgeInsets.only(top: 48), child: phoneNumber),
              Padding(
                  padding: const EdgeInsets.only(top: 48), child: button),
              textBottom
            ],
          ),
        ));
  }
}
