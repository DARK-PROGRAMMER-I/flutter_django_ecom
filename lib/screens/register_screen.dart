import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/screens/login_screen.dart';
import 'package:flutter_django_ecom/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  static const route_name = '/registerScreen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CustomTextField(
                     text: 'Name',
                     controller: nameCtr,
                   error: 'Please enter your name',
                 ),
                SizedBox(height: 10,),
                CustomTextField(
                    text: 'Email',
                    controller: emailCtr,
                  error: 'Please enter valid email',
                ),
                SizedBox(height: 10,),
                CustomTextField(
                    text: 'Password',
                    controller: passCtr, error: 'Enter atleast 5 char',
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          print('Error Logging-In');
                        }
                      },
                      child: Text('Sign-up'),

                    ),
                    SizedBox(width: 10,),
                    TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.lightGreen)
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, LoginScreen.route_name);
                        },
                        child: Text('Login ?')),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
