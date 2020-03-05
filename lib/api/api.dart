import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_api/api/logger.dart';
import 'package:project_api/api/user.dart';
import 'package:project_api/value/strings.dart';
import '../common/config.dart';
import 'package:logger/logger.dart';

class Api {
  final log = getLogger('className');

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
          log.i(onError(Strings.api_no_user));
      } else
        log.w(onError(Strings.api_text));
    } catch (e) {
      log.d(onError(Strings.api_error));
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
          log.e(onError(Strings.api_wrong));
        }
      } else {
        log.i(onError(Strings.api_text));
      }
    } catch (e) {
      log.d(onError(Strings.api_error));
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
          log.i(onError(Strings.api_no_user));
        }
      } else {
        onError(value['error_code']);
      }
    } catch (e) {
      log.i(onError(Strings.api_text));
    }
  }
}
