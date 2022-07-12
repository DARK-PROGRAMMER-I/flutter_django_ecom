import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserState with ChangeNotifier{


   Future<bool> login(String name, String password)async{
     LocalStorage localStorage = LocalStorage('token');
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
           localStorage.setItem('token', body['token']);
           return true;
         }
         print(false);
         return false;
      }catch(e){
        print('ERROR IN USER STATE');
         print(e);
         return false;
      }
   }

   Future<bool> register(String name, String email, String password)async{
     String url = 'http://10.0.2.2:8000/api/login';
     try{
       http.Response response = await http.post(
           Uri.parse(url),
           body: jsonEncode({
             'username': name,
             'email': email,
             'password': password
           }),
         headers: {
             'Content-Type': 'application/json'
         }
       );

       var status = jsonDecode(response.body);
       if(status['error'] == false){
         return true;
       }
       return false;
     }catch(e){
       return false;
     }
   }

}