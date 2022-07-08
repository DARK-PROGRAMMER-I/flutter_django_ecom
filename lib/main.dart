import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/screens/favourite_screen.dart';
import 'package:flutter_django_ecom/screens/home_screen.dart';
import 'package:flutter_django_ecom/screens/login_screen.dart';
import 'package:flutter_django_ecom/screens/product_detail_screen.dart';
import 'package:flutter_django_ecom/screens/register_screen.dart';
import 'package:flutter_django_ecom/state/product_state.dart';

import 'package:provider/provider.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=> ProductState())
        ],
      child: MaterialApp(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.lightGreen
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.lightGreen)
            )
          )
        ),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          ProductDetails.routeName: (context) => ProductDetails(),
          FavoriteScreen.route_name: (context)=> FavoriteScreen(),
          LoginScreen.route_name : (context) => LoginScreen(),
          RegisterScreen.route_name: (context) => RegisterScreen(),
        },
      ),

    );
  }
}
