import 'package:flutter/material.dart';

abstract class AuthenticationState {}

class AuthenticationAuthenticated extends AuthenticationState {
  List<dynamic> loadedCards;

  AuthenticationAuthenticated({@required this.loadedCards})
      : assert(loadedCards != null);
}

class AuthenticationUnauthenticated extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationFailure extends AuthenticationState {}
