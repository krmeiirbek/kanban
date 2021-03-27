import 'package:flutter/material.dart';

abstract class AuthenticationEvent {
  const AuthenticationEvent();
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String username;
  final String password;

  const LoggedIn({
    @required this.username,
    @required this.password,
  });
}

class LoggedOut extends AuthenticationEvent {}
