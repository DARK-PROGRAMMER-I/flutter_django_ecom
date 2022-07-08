
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  const CustomListTile({
    Key? key,
    required this.iconData,
    required this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(

      trailing: Icon(iconData),
      title: Text(title),
    );
  }
}
