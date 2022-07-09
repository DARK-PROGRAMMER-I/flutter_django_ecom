import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserState with ChangeNotifier{


   Future<String> login(String name, String password)async{
      String url = 'http://10.0.2.2:8000/api/login';
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
         Map body= jsonDecode(response.body);
         print(response.body);
         if(body.containsKey('token')){
           print(true);
           return 'True';
         }
         print(false);
         return 'False';
      }catch(e){
        print('ERROR IN USER STATE');
         print(e);
         return 'False';
      }
   }
}