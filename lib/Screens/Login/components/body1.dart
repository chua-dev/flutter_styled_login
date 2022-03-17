import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Login/components/background.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/components/rounded_button.dart';
import 'package:flutter_auth/components/rounded_input_field.dart';
import 'package:flutter_auth/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_auth/Screens/Services/authentication_service.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Body extends StatefulWidget {
  //const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _formKey = GlobalKey<FormState>();
  String email_value = '';
  String password_value = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    var currentUser;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (email) {
                setState(() => email_value = email);
              },
            ),
            RoundedPasswordField(
              onChanged: (password) {
                setState(() => password_value = password);
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () async {
                Response res = await AuthenticationService().signIn(email_value,password_value);
                final jsonBody = json.decode(res.body);
                print('Json Body');
                print(jsonBody['status']);
                currentUser = jsonBody['user'];
                print('Current User');
                print(currentUser);
                print(currentUser['name']);
              },
            ),

            SizedBox(height: size.height * 0.03),
            /*AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),*/
            Text("You haven't Login",
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )  ],
        ),
      ),
    );
  }
}
