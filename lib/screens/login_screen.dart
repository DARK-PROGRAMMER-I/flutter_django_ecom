import 'package:flutter/material.dart';
import 'package:flutter_django_ecom/screens/register_screen.dart';
import 'package:flutter_django_ecom/state/provider_state.dart';
import 'package:provider/provider.dart';
import '../widgets/custom_text_field.dart';


class LoginScreen extends StatefulWidget {
  static const route_name = '/loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  // TextEditingController nameCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login '),
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

                SizedBox(height: 10,),
                CustomTextField(
                  text: 'Email',
                  controller: emailCtr,
                  error: 'Please enter valid email',
                ),
                SizedBox(height: 10,),
                CustomTextField(
                  text: 'Password',
                  controller: passCtr,
                  error: 'Enter atleast 5 char',
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        if(!_formKey.currentState!.validate()){
                          Provider.of<ProviderState>(context, listen: false).emailCtrSetter(emailCtr);
                          Provider.of<ProviderState>(context, listen: false).passCtrSetter(passCtr);
                        }else{
                          print('Error Logging-In');
                        }
                      },
                      child: Text('Login'),

                    ),
                    SizedBox(width: 10,),
                    TextButton(
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all(Colors.lightGreen)
                        ),
                        onPressed: (){
                          Navigator.pushNamed(context, RegisterScreen.route_name);
                        },
                        child: Text('Register here')),
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
