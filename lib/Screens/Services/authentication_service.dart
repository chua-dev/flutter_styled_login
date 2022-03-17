import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import '../../main.dart';

class AuthenticationService {
  String destinationUrl = 'https://tkeeper.net/face/face_a';
  String authToken = 'Bq123wweUi31';

  
  Future<Response> signIn (String email, String password) async {
    // For Development Testing ONLY, Delete when deploy
    HttpOverrides.global = MyHttpOverrides();
    final Map<String, String> tokenData = {
      'Authorization': authToken,
      'Accept': '*/*',
    };


    Response res = await post(Uri.parse(destinationUrl),
      headers: tokenData,
      body: {
        "api_key": 'z8P09iOyu',
        "username": email,
        "password": password,
      }
    );
    print(res.statusCode);
    print(res.body);
    return res;
  }

}