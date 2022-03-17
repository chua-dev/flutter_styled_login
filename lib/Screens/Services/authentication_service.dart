import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class AuthenticationService {
  String destinationUrl = 'https://tkeeper.net/face/face_a';
  String authHeaders = 'empty';
  
  Future<Response> signIn({String email, String password}) async {
    Response res = await post(Uri.parse(destinationUrl),
      headers: <String, String>{'authorization': authHeaders},
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