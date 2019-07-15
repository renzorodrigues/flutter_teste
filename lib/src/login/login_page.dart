import 'package:carros/src/app_module.dart';
import 'package:carros/src/login/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _bloc = AppModule.to.bloc<LoginBloc>();
  var _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("renderizou");
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 50),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  width: 300,
                  child: TextField(
                    controller: _emailTextController,
                    onChanged: (text) => _bloc.emailInput(_emailTextController),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.email),
                        hintText: "Digite um e-mail válido",
                        labelText: "E-mail"),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: StreamBuilder(
                    stream: _bloc.outCtrl,
                    builder: (context, snapshot) {
                      return RaisedButton(
                        color: snapshot.data,
                        child: Icon(Icons.arrow_forward),
                        onPressed: () => _bloc.goToHomePage(context),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
