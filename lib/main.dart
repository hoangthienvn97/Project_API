import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:project_api/value/strings.dart';
import 'login_page.dart';
import 'company/create_company.dart';
import 'company/select_company.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => SelectCompany(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('en', 'US')],
      title: Strings.main,
      debugShowCheckedModeBanner: false,
      home: SelectCompany(),
      routes: routes,
    );
  }
}
