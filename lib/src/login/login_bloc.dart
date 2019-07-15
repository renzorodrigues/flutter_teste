import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:carros/src/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc extends BlocBase {

  var _buttonController = BehaviorSubject<Color>.seeded(Colors.blue);
  Stream<Color> get outCtrl => _buttonController.stream;
  Sink<Color> get inCtrl => _buttonController.sink;

  TextEditingController emailText;

  emailInput(TextEditingController emailTextController) {
    emailText = emailTextController;
    print(emailText.text);
    _validate();
  }

  _validate() {
    if (emailText.text.contains("@") && emailText.text.contains(".")){
      inCtrl.add(Colors.amber);
      return true;
    }
    else{
      inCtrl.add(Colors.blue);
      return false;
    }
  }

  goToHomePage(BuildContext context) {
    if (_validate()) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }
  }

  @override
  void dispose() {
    _buttonController.close();
    super.dispose();
  }
}
