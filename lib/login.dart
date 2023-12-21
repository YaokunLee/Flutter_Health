import 'dart:core';

import 'package:flutter/material.dart';
import 'package:jizhang/app_util.dart';
import 'package:jizhang/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

enum DialogDemoAction {
  cancel,
  connect,
}

class _LoginState extends State<Login> {
  @override
  initState() {
    super.initState();
  }

  void signin() {
    AppUtil.getTo(Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffdf8f2),
        elevation: 0,
        toolbarHeight: 0,
      ),
      backgroundColor: Color(0xfffdf8f2),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "images/mental_health.png",
              width: 200,
              height: 200,
            ),
            SizedBox(height: 10),
            Text(
              "You're not alone",
              style: TextStyle(fontSize: 15, color: Color(0xff333333)),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Together",
                  style: TextStyle(fontSize: 50, color: Color(0xff333333)),
                ),
                Text(
                  "for",
                  style: TextStyle(fontSize: 50, color: Color(0xff333333)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "brighter",
                  style: TextStyle(fontSize: 43, color: Color(0xff3433ff)),
                ),
                Text(
                  "days.",
                  style: TextStyle(fontSize: 43, color: Color(0xff333333)),
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Log in to personalize your experience and track your progress",
              style: TextStyle(fontSize: 20, color: Color(0xff555555)),
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                signin();
              },
              behavior: HitTestBehavior.opaque,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0XFF000000),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "images/google.png",
                      width: 30,
                      height: 30,
                    ),
                    SizedBox(width: 20),
                    Text("Sign in with Google",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffffffff)))
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("By continuing I agree to the Terms of Use and Privacy Policy",
                style: TextStyle(fontSize: 12, color: Color(0xff666666)))
          ],
        ),
      ),
    );
  }
}
