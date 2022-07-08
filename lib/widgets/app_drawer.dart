
import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/screens/favourite_screen.dart';
import 'package:flutter_django_ecom/screens/home_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Easy Navigation'),
            automaticallyImplyLeading: false,
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
            trailing: Icon(Icons.home),
            title: Text("Home Page"),
          ),
          ListTile(
            onTap: (){
              Navigator.pushNamed(context, FavoriteScreen.route_name);
            },
            title: Text('Favourites'),
            trailing: Icon(Icons.favorite, color: Colors.redAccent,),
          ),
        ],
      ),
    );
  }
}
