import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'login_page.dart';
import 'login_password.dart';
import 'sign_up.dart';
import 'foreign_password.dart';
import './company/select_company.dart';
import './company/create_company.dart';
import './company_infor/checkIn_action.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String,WidgetBuilder>{
    LoginPage.tag: (context) =>LoginPage(),
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en','US')
      ],
      title: 'Ahihi code funny',
      debugShowCheckedModeBanner: false,
      home: KeyValuePairDropdown(),
      routes: routes,
    );
  }
}