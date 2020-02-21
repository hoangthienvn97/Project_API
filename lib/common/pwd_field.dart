import 'package:flutter/material.dart';

class PwdField extends StatelessWidget {
  final TextEditingController controller;
  final PwdType type;

  PwdField(@required this.controller, {this.type = PwdType.pwd});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextFormField(
      autofocus: false,
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: type == PwdType.pwd ? "Nhập mật khẩu" : "Nhập lại mật khẩu",
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    ));
  }
}

enum PwdType { pwd, confirm }
