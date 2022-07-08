import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String error;
  final String text;
  final TextEditingController controller;
  const CustomTextField({
    Key? key,
    required this.text,
    required this.controller, required this.error
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.text,
        hintText: widget.text,
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.lightGreen
            )
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.lightGreen
            )
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.lightGreen
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.lightGreen
            )
        ),
        // focusColor: Colors.lightGreen,


      ),
      validator: (val) => val!.isEmpty ? widget.error : null ,
    );
  }
}
