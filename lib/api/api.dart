import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_api/value/strings.dart';

class Api {
  var client = http.Client;
  Future<void> checkingUser(
      {String gmail,
      Function(bool) onSusses, 
      Function(String) onError}) async {
    String url =
        'https://auth-dev.wisami.com/oauth2/authorize?response_type=code&redirect_uri=https://auth-dev.wisami.com/oauth2/code&client_id=wisami_base_1522119499';
    Map<String, dynamic> body = {
      'phone': gmail,
      'pass': 'undefinecode348764765'
    };
    var res = await http.post(url, body: body);
    print("res body" + res.body);
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);
        if (data["error_code"] == 6) {
          onSusses(true);
        } else
          onError(Strings.api_checkin_onError_1);
      } else
        onError(Strings.api_checkin_onError_2);
    } catch (e) {
      onError(Strings.api_checkin_onError_3);
    }
  }

  Future<void> login(
      {String gmail,
      String password,
      Function(String) onSusses,
      Function(String) onError}) async {
    String url =
        'https://auth-dev.wisami.com/oauth2/authorize?response_type=code&redirect_uri=https://auth-dev.wisami.com/oauth2/code&client_id=wisami_base_1522119499';
    Map<String, dynamic> body = {'phone': gmail, 'pass': password};
    var res = await http.post(url, body: body);

    print("res body" + res.body);
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);
        if (data['error_code'] == 3) {
          onSusses(Strings.api_login_onSusses);
        } else {
          onError(Strings.api_login_onError_1);
        }
      } else {
        onError(Strings.api_checkin_onError_2);
      }
    } catch (e) {
      onError(Strings.api_login_onError_3);
    }
  }

  Future<void> signUp(
      {String gmail,
      String password,
      String user,
      Function(String) onSusses,
      Function(String) onError}) async {
    String url =
        'https://auth-dev.wisami.com/user';
    Map<String, dynamic> body = {
      'name': user, 
      'pass': password,
      'email': gmail };
    var res = await http.post(url, body: body);

    print("res body" + res.body);
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);
        if (data['error_code'] == 11) {
          onSusses(Strings.api_signup_onSusses);
        } else {
          onError(Strings.api_signup_onError_1);
        }
      } else {
        onError(Strings.api_signup_onError_2);
      }
    } catch (e) {
      onError(Strings.api_signup_onError_3);
    }
  }
}
