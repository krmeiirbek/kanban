import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/auth.dart';
import 'package:my_app/generated/l10n.dart';
import 'package:my_app/style/theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn(
          username: _loginController.text, password: _passwordController.text));
    }

    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationFailure) {
          setState(() {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(S.of(context).login_failed),
              backgroundColor: Themes.errorC,
            ));
          });
        }
      },
      child: Scaffold(
        backgroundColor: Themes.mainBC,
        appBar: AppBar(
          backgroundColor: Themes.appBarBC,
          title: Text(
            S.of(context).title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Themes.textC),
          ),
        ),
        body: Container(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _loginController,
                    validator: (val) => (val.length < 4 && val.length != 0)
                        ? S.of(context).error_login
                        : null,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Themes.textC),
                    decoration: InputDecoration(
                      hintText: S.of(context).hint_login,
                      hintStyle: TextStyle(color: Themes.hintC),
                      errorStyle: TextStyle(color: Themes.errorC),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.errorC, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.errorC, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.hintC, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.tealC, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (val) => (val.length < 8 && val.length != 0)
                        ? S.of(context).error_password
                        : null,
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Themes.textC),
                    decoration: InputDecoration(
                      hintText: S.of(context).hint_password,
                      hintStyle: TextStyle(color: Themes.hintC),
                      errorStyle: TextStyle(color: Themes.errorC),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.errorC, width: 2),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.errorC, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.hintC, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(29)),
                        borderSide: BorderSide(color: Themes.tealC, width: 2),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate())
                        _onLoginButtonPressed();
                    },
                    child: Text(
                      S.of(context).log_in,
                      style: TextStyle(color: Themes.blackC, fontSize: 18),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Themes.tealC,
                      shape: StadiumBorder(),
                      side: BorderSide(width: 2, color: Themes.tC),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
