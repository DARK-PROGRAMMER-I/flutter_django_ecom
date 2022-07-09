import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/models/product.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProductState with ChangeNotifier{

  List<Product> _products = [];
  List<Product> _favProducts = [];
  String? token;

  Future getToken()async{
    final SharedPreferences prefs =await SharedPreferences.getInstance();
    token = prefs.getString('token');
  }

  Future<bool> getProducts()async{
    getToken();
    String url = 'http://10.0.2.2:8000/api/products';
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'authorization': 'token$token',
      });
      print('here');
      var data = jsonDecode(response.body) as Map<String, dynamic>;
      print('or here');
      List<Product> temp = [];
      List<Product> temp1 = [];
      print(data);
      // data.forEach((element) {
      //   Product product = Product.fromJson(element);
      //   temp.add(product);
      //   if(product.favourite!){
      //     temp1.add(product);
      //   }
      // });
      _favProducts = temp1;
      _products = temp;
      notifyListeners();
      return true;

    }catch(e){
      print(e);
      return false;
    }
  }

  Future<void> favouriteButton(int id) async{
    String url = 'http://10.0.2.2:8000/api/favourites';
    try{
      http.Response response = await http.post(Uri.parse(url), body: json.encode(
          {
            'id': id,
          }),
      headers: {
        'Content-Type': 'application/json',
        'authorization': 'token be185c06ede7f8c392a5a8c63603af5aad296c77',
      }
      );
      bool condition = json.decode(response.body)['error'];
      if(!condition){
          getProducts();
      }else{
        print('Hola its  a mistake!');
      }


    }catch(e){
      print(e);
    }
  }

  List<Product> get products{

    return [..._products];
  }

  List<Product> get favoriteProds{
    return [..._favProducts];
  }

  Product singleProduct(int id){
    return _products.firstWhere((element) => element.id == id);
  }
  
}