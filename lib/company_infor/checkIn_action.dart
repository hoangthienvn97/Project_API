import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/rendering.dart';
import '../value/strings.dart';

class CheckInAction extends StatefulWidget {
  @override
  CheckInActionState createState() {
    return new CheckInActionState();
  }
}

class CheckInActionState extends State<CheckInAction> {
  bool checkinSuccess = false;
  String networkStatus = '';
  Connectivity connectivity = Connectivity();

  void checkConnect() async {
    var connectivityResult = await connectivity.checkConnectivity();
    var conn = getConnectionValue(connectivityResult);
    setState(() {
      networkStatus = conn;
    });
  }

  String getConnectionValue(var connectivityResult) {
    String status = '';
    switch (connectivityResult) {
      case ConnectivityResult.mobile:
        return Strings.ci_st1;
        break;
      case ConnectivityResult.wifi:
        return Strings.ci_st2;
        break;
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Column(
        children: <Widget>[
          Container(
              height: size.height * (1 / 5),
              color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 42, bottom: 16),
                    child: Text(
                      Strings.timekeeping.toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.14),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      child: Text(Strings.ci_name_cpny))
                ],
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 24),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.wifi,
                      color: Colors.blue,
                    ),
                    Text(Strings.ci_name_cpny)
                  ],
                ),
                Text(networkStatus),
                OutlineButton(
                  child: Text(Strings.ci_btn),
                  onPressed: () {
                    checkConnect();
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                checkinSuccess = !checkinSuccess;
              });
            },
            child: Container(
              width: size.width * (1 / 2),
              height: size.width * (1 / 3),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: checkinSuccess ? Colors.grey : Colors.blueAccent),
              child: Text(
                checkinSuccess
                    ? Strings.ci_cout.toUpperCase()
                    : Strings.ci_cin.toUpperCase(),
                style: TextStyle(
                    color: checkinSuccess ? Colors.red : Colors.white,
                    fontSize: 18),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 12),
            child: GestureDetector(
              onTap: () {
                onSelectDay(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue,
                  ),
                  Text(_dateTime.toString()),
                ],
              ),
            ),
          ),
          Visibility(
            visible: checkinSuccess,
            child: Container(
              height: size.height * (1 / 4),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                      color: Colors.blue, child: Text("${TimeOfDay.now()}")),
                  Container(
                    height: 2,
                    color: Colors.blue,
                    width: double.infinity,
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.flag,
                              color: Colors.blue,
                            ),
                            Text(
                              Strings.ci_clock,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            Text(
                              Strings.ci_start,
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  DateTime _dateTime = DateTime.now();
  onSelectDay(BuildContext context) async {
    DateTime _t = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
    );

    setState(() {
      _dateTime = _t;
    });
  }
}
