import 'package:flutter/cupertino.dart';

class ProviderState with ChangeNotifier{
  TextEditingController pasCtr = TextEditingController();
  TextEditingController emailCtr = TextEditingController();

  passCtrSetter(TextEditingController passCtr  ){
    pasCtr = passCtr;
    notifyListeners();
  }
  emailCtrSetter(TextEditingController emlCtr){
    emailCtr = emlCtr;
    notifyListeners();
  }

}