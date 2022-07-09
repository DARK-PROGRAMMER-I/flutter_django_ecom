import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserState with ChangeNotifier{
   Future<void> login(String name, String password)async{
      String url = 'http://127.0.0.1:8000/api/login';
      try{
         http.Response response = await http.post(
             Uri.parse(url),
             body: jsonEncode({
                'username':"$name",
                'password': "$password"
             }),
            headers: {
               'Content-Type': 'application/json',
            }
         );
         print(response.body);
      }catch(e){
        print('ERROR IN USER STATE');
         print(e);
      }
   }
}