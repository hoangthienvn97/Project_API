import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_api/api/user.dart';
import 'package:project_api/value/strings.dart';
import '../common/config.dart';

class Api {
  var client = http.Client;
  Future<void> checkingUser(
      {String gmail, Function(bool) onSusses, Function(String) onError}) async {
    String url = UrlList.url;
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
        onError(Strings.api_text);
    } catch (e) {
      onError(Strings.api_error);
    }
  }

  Future<void> login(
      {String gmail,
      String password,
      Function(String) onSusses,
      Function(String) onError}) async {
    String url = UrlList.url;
    Map<String, dynamic> body = {'phone': gmail, 'pass': password};
    var res = await http.post(url, body: body);

    print("res body" + res.body);
    try {
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);
        if (data['error_code'] == 3) {
          onSusses(Strings.api_right);
        } else {
          onError(Strings.api_wrong);
        }
      } else {
        onError(Strings.api_text);
      }
    } catch (e) {
      onError(Strings.api_error);
    }
  }

  Future<void> signUp(
      {String gmail,
      String password,
      String user,
      Function(User) onSusses,
      Function(String) onError}) async {
    String url = UrlList.url_SignUp;
    Map<String, dynamic> body = {
      'name': user,
      'pass': password,
      'email': gmail
    };
    var res = await http.post(url, body: body);

    print("res body" + res.body);

    try {
      Map<String, dynamic> value = json.decode(res.body);
      if (res.statusCode == 200) {
        if (value['data'] != null) {
          User data = User.fromJson(value['data']);
          onSusses(data);
          return;
        }
        if (value['error_code'] == 11) {
          onError(value['error_code']);
        } else {
          onError('User not found');
        }
      } else {
        onError(value['error_code']);
      }
    } catch (e) {
      onError('Something get wrong');
    }
  }
}
