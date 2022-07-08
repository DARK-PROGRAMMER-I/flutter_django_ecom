import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/models/product.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductState with ChangeNotifier{

  List<Product> _products = [];
  List<Product> _favProducts = [];

  Future<bool> getProducts()async{
    String url = 'http://10.0.2.2:8000/api/products';
    try {
      http.Response response = await http.get(Uri.parse(url), headers: {
        'authorization': 'token be185c06ede7f8c392a5a8c63603af5aad296c77',
      });

      var data = jsonDecode(response.body) as List;
      List<Product> temp = [];
      List<Product> temp1 = [];
      data.forEach((element) {
        Product product = Product.fromJson(element);
        temp.add(product);
        if(product.favourite!){
          temp1.add(product);
        }
      });
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